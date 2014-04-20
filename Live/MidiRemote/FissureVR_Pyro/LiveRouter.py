from Pyro.EventService.Clients import Subscriber
import Pyro.core
import Pyro.errors

import sys
sys.path.append("/Users/mystfit/Code/zmqshowtime")
from zst_node import ZstNode
from zst_method import ZstMethod
from ExposedMethods import ExposedMethods


# Event listener class for recieving/parsing messages from Live
class LiveRouter(Subscriber):

    def __init__(self, stageaddress):
        Subscriber.__init__(self)
        self.setThreading(False)

        subscribedMethods = [
            ExposedMethods.Out.FIRED_SLOT_INDEX,
            ExposedMethods.Out.PLAYING_SLOT_INDEX]
        self.subscribe(subscribedMethods)

        uri = "PYRONAME://" + Pyro.constants.EVENTSERVER_NAME
        self.publisher = Pyro.core.getProxyForURI(uri)

        self.node = ZstNode("LiveNode", stageaddress)
        self.node.request_register_node()
        self.register_methods()

    def register_methods(self):
        # Incoming methods
        self.node.request_register_method(
            ExposedMethods.Out.FIRED_SLOT_INDEX, ZstMethod.READ)
        self.node.request_register_method(
            ExposedMethods.Out.PLAYING_SLOT_INDEX, ZstMethod.READ)

        # Outgoing methods
        self.node.request_register_method(
            ExposedMethods.In.FIRE_CLIP,
            ZstMethod.WRITE,
            {"trackindex": 0, "clipindex": 0},
            self.fire_clip)

    def handle_requests(self):
        self.getDaemon().handleRequests(0.01)
        self.node.handle_requests()

    def event(self, event):
        #print "\nIN: " + event.subject, '=', event.msg
        if event.subject in self.node.methods:
            if isinstance(event.msg, dict):
                self.node.update_local_method_by_name(event.subject, event.msg)
            else:
                print "Remote method argument not a dictionary! Got '{0}' instead.".format(event.msg)
        else:
            print "Outgoing method not registered!"

    # ------------------------
    # Incoming method wrappers
    # ------------------------
    def fire_clip(self, args):
        print "About to fire clip!"
        try:
            self.publisher.publish(
                ExposedMethods.In.FIRE_CLIP,
                {"trackindex": args["trackindex"], "clipindex": args["clipindex"]})
        except Pyro.errors.ConnectionClosedError:
            print "Lost connection to event service"

        #self.live.turn_on_clip(args["clipindex"])
