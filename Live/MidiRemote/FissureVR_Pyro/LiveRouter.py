from Pyro.EventService.Clients import Subscriber
import Pyro.core
import Pyro.errors

import sys
sys.path.append("/Users/mystfit/Code/zmqshowtime")
from zst_node import ZstNode
from zst_method import ZstMethod
from LiveWrappers import *


# Event listener class for recieving/parsing messages from Live
class LiveRouter(Subscriber):

    def __init__(self, stageaddress):
        Subscriber.__init__(self)
        self.setThreading(False)

        subscribedMethods = [
            PyroTrack.FIRED_SLOT_INDEX,
            PyroTrack.PLAYING_SLOT_INDEX]
        self.subscribe(subscribedMethods)

        uri = "PYRONAME://" + Pyro.constants.EVENTSERVER_NAME
        self.publisher = Pyro.core.getProxyForURI(uri)

        self.node = ZstNode("LiveNode", stageaddress)
        self.node.request_register_node()
        self.register_methods()

    def register_methods(self):
        # Outgoing methods
        self.node.request_register_method(
            PyroTrack.FIRED_SLOT_INDEX, ZstMethod.READ)
        self.node.request_register_method(
            PyroTrack.PLAYING_SLOT_INDEX, ZstMethod.READ)

        self.node.request_register_method(
            PyroDeviceParameter.VALUE_UPDATED, ZstMethod.READ)
        self.node.request_register_method(
            PyroDevice.PARAMETERS_UPDATED, ZstMethod.READ)

        # Incoming methods
        self.node.request_register_method(
            PyroTrack.FIRE_CLIP,
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
            self.publisher.publish(PyroTrack.FIRE_CLIP, args)
        except Pyro.errors.ConnectionClosedError:
            print "Lost connection to event service"

        #self.live.turn_on_clip(args["clipindex"])
