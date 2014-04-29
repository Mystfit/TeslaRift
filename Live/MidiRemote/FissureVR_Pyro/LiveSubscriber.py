from Pyro.EventService.Clients import Subscriber

from LiveWrappers import *
from LiveUtils import *


# Event listener class for recieving/parsing messages from Live
class LiveSubscriber(Subscriber):

    def __init__(self, publisher, logger):
        Subscriber.__init__(self)
        self.log_message = logger
        self.setThreading(False)
        self.publisher = publisher

        self.valueChangedMessages = None
        self.requestLock = True
        self.parameters = None

        subscribed = [PyroTrack.FIRE_CLIP, PyroDeviceParameter.SET_VALUE]
        self.subscribe(subscribed)

    def set_parameter_list(self, parameterList):
        self.parameters = parameterList

    def handle_requests(self):
        requestCounter = 0

        # Loop through all messages in the Pyro queue till it's empty
        while self.requestLock:
            self.requestLock = False
            try:
                self.getDaemon().handleRequests()
            except Exception, e:
                print e
            requestCounter += 1
        self.requestLock = True
        if requestCounter > 10:
            self.log_message(str(requestCounter) + " loops to clear queue")

        if self.valueChangedMessages:
            self.process_value_changed_messages(self.valueChangedMessages)
            self.valueChangedMessages = None

    def process_value_changed_messages(self, queue):
        for parametertuple, value in queue.iteritems():
            try:
                self.parameters[parametertuple].get_parameter().value = value
            except RuntimeError, e:
                self.log_message(e)

    def event(self, event):
        self.requestLock = True     # Lock the request loop
        if hasattr(self, event.subject):
            getattr(self, event.subject)(event.msg)
        else:
            print "Incoming method not registered!"

    # ---------------------------
    # Incoming method controllers
    # ---------------------------
    def get_song_layout(self, args):
        self.log_message("Requesting song layout")
        song = PyroSong(self.publisher)
        song.get_song_layout(args)

    def fire_clip(self, args):
        try:
            launchClip(int(args["trackindex"]), int(args["clipindex"]))
            self.log_message("Firing clip " + clipStr)
        except AttributeError:
            self.log_message("Clip not found! " + clipStr)

    def set_value(self, args):
        key = (
            int(args["trackindex"]),
            int(args["deviceindex"]),
            int(args["parameterindex"]))

        # Rather than setting the parameter value immediately,
        # we combine similar value messages so only the most up to date
        # message gets applied when the clock triggers our update
        if not self.valueChangedMessages:
            self.valueChangedMessages = {}
        self.valueChangedMessages[key] = float(args["value"])
