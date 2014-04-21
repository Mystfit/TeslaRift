from Pyro.EventService.Clients import Subscriber

from LiveWrappers import *
from LiveUtils import *


# Event listener class for recieving/parsing messages from Live
class LiveIncomingSubscriber(Subscriber):

    def __init__(self, logger):
        Subscriber.__init__(self)
        self.log_message = logger

        subscribed = [PyroTrack.FIRE_CLIP]
        self.subscribe(subscribed)

    def handle_requests(self):
        self.getDaemon().handleRequests(0.01)

    def event(self, event):
        print event.subject, event.msg
        if hasattr(self, event.subject):
            getattr(self, event.subject)(event.msg)
        else:
            print "Incoming method not registered!"

    def fire_clip(self, args):
        clipStr = "Track:" + str(args["trackindex"]) + "Clip:" + str(args["clipindex"])
        try:
            launchClip(int(args["trackindex"]), int(args["clipindex"]))
            self.log_message("Firing clip " + clipStr)
        except AttributeError:
            self.log_message("Clip not found! " + clipStr)
