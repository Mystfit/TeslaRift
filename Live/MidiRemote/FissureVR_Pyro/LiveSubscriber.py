from Pyro.EventService.Clients import Subscriber

import sys
sys.path.append("/Users/mystfit/Code/zmqshowtime")
from zst_node import ZstNode
from zst_method import ZstMethod


# Event listener class for recieving/parsing messages from Live
class LiveSubscriber(Subscriber):
    def __init__(self, stageaddress):
        Subscriber.__init__(self)
        self.subscribe(["CLIP_EVENT", "PARAM_EVENT", "TRACK_EVENT", "REBUILD_EVENT"])
        self.live = None
        self.node = ZstNode("LiveNode", stageaddress)
        self.node.request_register_node()
        self.node.request_register_method("track_clip_fired", ZstMethod.READ)
        self.node.request_register_method("fire_clip", ZstMethod.WRITE, {"clipindex": 0}, self.fire_clip)

    def handle_requests(self):
        self.getDaemon().handleRequests(0.01)
        self.node.handle_requests()

    def event(self, event):
        print "IN: " + event.subject, '=', event.msg

        if event.subject == "TRACK_EVENT":
            self.track_clip_fired(0)

    def track_clip_fired(self, index):
        print "Track fired a clip: ", index
        self.node.update_local_method_by_name("fire_clip", index)

    def fire_clip(self, args):
        self.live.turn_on_clip(args["clipindex"])
