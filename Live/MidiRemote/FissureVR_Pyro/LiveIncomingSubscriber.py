from Pyro.EventService.Clients import Subscriber
from ExposedMethods import ExposedMethods

from LiveUtils import *


# Event listener class for recieving/parsing messages from Live
class LiveIncomingSubscriber(Subscriber):

    # Constants for incoming functions
    FIRE_CLIP = "fire_clip"

    subscribedMethods = [FIRE_CLIP]

    def __init__(self, logger):
        Subscriber.__init__(self)
        self.log_message = logger

        subscribed = [ExposedMethods.In.FIRE_CLIP]
        self.subscribe(subscribed)

    def handle_requests(self):
        self.getDaemon().handleRequests(0.01)

    def event(self, event):
        #self.log_message("\nIN: " + event.subject)
        if hasattr(self, event.subject):
            getattr(self, event.subject)(event.msg)
        else:
            print "Incoming method not registered!"

    def fire_clip(self, args):
        launchClip(int(args["trackindex"]), int(args["clipindex"]))
        self.log_message("Firing clip!")
