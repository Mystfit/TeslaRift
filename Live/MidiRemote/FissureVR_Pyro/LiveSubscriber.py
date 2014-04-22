from Pyro.EventService.Clients import Subscriber

from LiveWrappers import *
from LiveUtils import *


# Event listener class for recieving/parsing messages from Live
class LiveSubscriber(Subscriber):

    def __init__(self, logger):
        Subscriber.__init__(self)
        self.log_message = logger
        self.setThreading(False)

        self.valueChangedMessages = None
        self.requestLock = True

        self.set_encoder_value = None
        self.parameters = None

        subscribed = [PyroTrack.FIRE_CLIP, PyroDeviceParameter.SET_VALUE]
        self.subscribe(subscribed)

    def set_parameter_list(self, parameterList):
        self.parameters = parameterList

    def add_parameter(self, parametertuple, parameter):
        self.parameters[parametertuple] = parameter

    def handle_requests(self):
        #self.log_message("Processing messages")
        requestCounter = 0
        while self.requestLock:
            self.requestLock = False
            self.getDaemon().handleRequests(0)
            requestCounter  += 1
        self.requestLock = True
        #if requestCounter > 1:
            #self.log_message(str(requestCounter) + " loops")

        if self.valueChangedMessages:
            self.process_value_changed_messages(self.valueChangedMessages)
            self.valueChangedMessages = None

    def event(self, event):
        self.requestLock = True     # Lock the request loop
        self.log_message(str(event.subject) + " " + str(event.msg))
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

    def set_value(self, args):
        track = getTrack(int(args["trackindex"]))
        device = track.devices[int(args["deviceindex"])]
        parameter = device.parameters[int(args["parameterindex"])]

        #parameter.value = float(args["value"])
        key = (int(args["trackindex"]), int(args["deviceindex"]), int(args["parameterindex"]))
        if not self.valueChangedMessages:
            self.valueChangedMessages = {}
        self.valueChangedMessages[key] = float(args["value"])

    def process_value_changed_messages(self, queue):
        for parametertuple, value in queue.iteritems():
            try:
                #self.set_encoder_value(parametertuple, value)
                self.parameters[parametertuple].get_parameter().value = value
            except RuntimeError, e:
                self.log_message(e)
