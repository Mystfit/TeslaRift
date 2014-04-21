import Live
from _Framework.EncoderElement import *
from _Framework.InputControlElement import InputControlElement, MIDI_SYSEX_TYPE
from _Framework.Util import *
from .. LiveWrappers import PyroDeviceParameter
import Pyro.errors


class PyroEncoderElement(EncoderElement):

    def __init__(self, parameter=None):
        super(PyroEncoderElement, self).__init__(MIDI_SYSEX_TYPE, None, None, None, None)
        self.trackindex = None
        self.deviceindex = None
        self.parameterindex = None
        self._report_input = True
        self._report_output = True
        self.connect(parameter)

    def set_publisher(self, publisher):
        self.publisher = publisher

    def set_indexes(self, trackindex, deviceindex, parameterindex):
        self.trackindex = trackindex
        self.deviceindex = deviceindex
        self.parameterindex = parameterindex

    def set_debugger(self, logger):
        self.log_message = logger

    def connect(self, parameter):
        # self.parameterslot = ParameterSlot(parameter, self)
        EncoderElement.connect_to(self, parameter)
        if self.mapped_parameter() is not None:
            try:
                self.mapped_parameter().remove_value_listener(self.value_updated)
            except:
                pass
        self.mapped_parameter().add_value_listener(self.value_updated)

    def send_value(self, value):
        #EncoderElement.send_value(self, value)
        try:
            self.publisher.publish(PyroDeviceParameter.VALUE_UPDATED, {
                "trackindex": self.trackindex,
                "deviceindex": self.deviceindex,
                "parameterindex": self.parameterindex,
                "value": value})
        except Pyro.errors.ConnectionClosedError:
            print "Lost connection to event service"

    def value_updated(self):
        if self.mapped_parameter():
            self.send_value(self.mapped_parameter().value)
