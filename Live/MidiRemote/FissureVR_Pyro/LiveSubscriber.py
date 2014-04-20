from Pyro.EventService.Clients import Subscriber

import sys
sys.path.append("/Users/mystfit/Code/zmqshowtime")
from zst_node import ZstNode
from zst_method import ZstMethod


# Event listener class for recieving/parsing messages from Live
class LiveSubscriber(Subscriber):
    def __init__(self, stageaddress):
        Subscriber.__init__(self)
        self.subscribe(["CLIP_EVENT", "PARAM_EVENT", "REBUILD_EVENT"])
        self.live = None
        self.node = ZstNode("LiveNode", stageaddress)
        self.node.request_register_node()
        self.node.request_register_method("fire_clip", ZstMethod.READ)

    def handle_requests(self):
        self.getDaemon().handleRequests()

    def event(self, event):
        print "IN: " + event.subject, '=', event.msg

        #Test message patterns
        self.test_messages(event)

    def fire_clip(self, clip):
        print "OUT: " + clip
        self.live.turn_on_clip(clip)
        self.node.update_local_method_by_name("fire_clip", clip)

    def test_messages(self, event):
        if event.msg['name'] == "32-emptyclipslot":
            self.fire_clip('25-emptyclipslot')
        elif event.msg['name'] == "25-emptyclipslot":
            self.fire_clip('16-emptyclipslot')
