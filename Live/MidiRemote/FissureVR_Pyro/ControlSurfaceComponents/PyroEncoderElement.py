import Live
from _Framework.EncoderElement import *
from _Framework.InputControlElement import ParameterSlot
from _Framework.Util import *

class PyroEncoderElement(EncoderElement):

    def __init__(self, msg_type=None, channel=None, identifier=None, map_mode=None, encoder_sensitivity = None, *a, **k):
        EncoderElement.__init__(self, msg_type, channel, identifier, map_mode, encoder_sensitivity, *a, **k)
        self.pyroRemote = None
        self.parameterslot = None

    def set_publisher(self, publisher):
        self.publisher = publisher

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

    def send_value(self, value):
        self.pyroRemote.send_value(str(value))
        EncoderElement.send_value(self, value)

    def value_updated(self):
        self.send_value(self.parameterslot.parameter.value)
