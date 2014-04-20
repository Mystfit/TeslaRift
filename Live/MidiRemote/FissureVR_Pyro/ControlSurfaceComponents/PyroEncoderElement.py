import Live
from _Framework.EncoderElement import *
from _Framework.InputControlElement import ParameterSlot
from _Framework.Util import *

class PyroEncoderElement(EncoderElement):

    def __init__(self, msg_type=None, channel=None, identifier=None, map_mode=None, encoder_sensitivity = None, *a, **k):
        EncoderElement.__init__(self, msg_type, channel, identifier, map_mode, encoder_sensitivity, *a, **k)
        self.pyroRemote = None
        self.parameterslot = None

    def set_remote(self, pyroEncoder):
        self.pyroRemote = pyroEncoder

    def set_debugger(self, logger):
        self.log_message = logger

    def connect(self, parameter):
        self.parameterslot = ParameterSlot(parameter, self)
        #EncoderElement.connect_to(self, parameter)
        if self.mapped_parameter() is not None:
            try:
                self.mapped_parameter().remove_value_listener(self.value_updated)
            except:
                pass
        self.mapped_parameter().add_value_listener(self.value_updated)

    def receive_value(self, value):
        EncoderElement.receive_value(self, value)
        self.log_message(self.pyroRemote.id + " recieved message: " + str(value))

    def send_value(self, value):
        self.pyroRemote.send_value(str(value))
        EncoderElement.send_value(self, value)

    def value_updated(self):
    #   self.log_message("Triggered button")
        #self.log_message(str(self.pyroRemote.getId()) + ": " + str(self.mapped_parameter().value))
        self.send_value(self.parameterslot.parameter.value)
        #self.pyroRemote.send_value("Testing")

    def _verify_value(self, value):
        upper_bound = 16384
        if not in_range(value, 0, upper_bound):
            raise AssertionError
