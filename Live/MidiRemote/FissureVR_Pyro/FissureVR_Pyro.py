from __future__ import with_statement

# Append Pyro and missing standard python scripts to the path
import sys
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5")
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/lib-dynload")
sys.path.append("/Library/Python/2.5/site-packages")

import sys
import encodings
import select
from functools import partial

# Import pyro
import Pyro.naming
import Pyro.errors
import Pyro.core
Pyro.config.PYRO_STORAGE = "/tmp"

# Import Live libraries
import Live
from _Framework.ControlSurface import ControlSurface
from _Framework.EncoderElement import EncoderElement
from _Framework.InputControlElement import InputControlElement, MIDI_CC_TYPE
from _Framework.Util import in_range


# Import custom live objects
from LiveUtils import *
from ControlSurfaceComponents import *
from ControlSurfaceComponents.PyroEncoderElement import PyroEncoderElement
from LiveWrappers import *
from LiveSubscriber import LiveSubscriber


class FissureVR_Pyro(ControlSurface):

    def __init__(self, c_instance):
        ControlSurface.__init__(self, c_instance)
        with self.component_guard():
            self._suppress_send_midi = True
            self.cInstance = c_instance

            debug_log(self, "--------------------------")
            debug_log(self, "FissureVR Pyro DEBUG_START")

            # Wrappers for Ableton objects
            self.tracks = []
            self.encoders = {}
            self.clock = None

            self.initPyroServer()
            self.build_wrappers()
            self._suppress_send_midi = False

    def initPyroServer(self):
        Pyro.config.PYRO_ES_BLOCKQUEUE = False

        # Event listener
        Pyro.core.initClient()

        # Create publisher
        self.publisher = Pyro.core.getProxyForURI("PYRONAME://" + Pyro.constants.EVENTSERVER_NAME)
        self.subscriber = LiveSubscriber(self.log_message)
        self.subscriber.set_encoder_value = self.set_encoder_value

        # Hook requests to the song timer for max performance. Thanks to Remix.net's LiveOSC module.
        #getSong().add_current_song_time_listener(self.requestLoop)

    def disconnect(self):
        self._suppress_send_midi = True
        self._suppress_send_midi = False
        ControlSurface.disconnect(self)

    def refresh_state(self):
        ControlSurface.refresh_state(self)
        self.request_rebuild_midi_map()

    def build_midi_map(self, midi_map_handle):
        self.log_message("Building midi map...")
        ControlSurface.build_midi_map(self, midi_map_handle)

    # def build_midi_map(self, midi_map_handle):
    #     """ Live -> Script
    #         Build DeviceParameter Mappings, that are processed in Audio time, or
    #         forward MIDI messages explicitly to our receive_midi_functions.
    #         Which means that when you are not forwarding MIDI, nor mapping parameters,
    #         you will never get any MIDI messages at all.
    #     """
    #     # for control in self.controls:
    #     #     control.build_midi_map(self, midi_map_handle)
    #     with self._in_build_midi_map():
    #         self._forwarding_registry.clear()
    #         self._forwarding_long_identifier_registry.clear()
    #         for control in self.controls:
    #             if isinstance(control, InputControlElement):
    #                 self.log_message("Installing connections " + str(control))
    #                 control.install_connections(self._translate_message, partial(self._install_mapping, midi_map_handle), partial(self._install_forwarding, midi_map_handle))

    #         if self._pad_translations != None:
    #             self._c_instance.set_pad_translation(self._pad_translations)

    # def _install_mapping(self, midi_map_handle, control, parameter, feedback_delay, feedback_map):
    #     success = None
    #     self.log_message("About to start mapping - " + str(self._in_build_midi_map.value))
    #     if not self._in_build_midi_map:
    #         self.log_message("In mapping")
    #         #raise AssertionError
    #         self.log_message("After first assertion")
    #         raise control != None and parameter != None or AssertionError
    #         self.log_message("After control/parameter check")
    #         raise isinstance(parameter, Live.DeviceParameter.DeviceParameter) or AssertionError
    #         self.log_message("After parameter type check")
    #         raise isinstance(control, InputControlElement) or AssertionError
    #         self.log_message("After inputcontrol type check")
    #         raise isinstance(feedback_delay, int) or AssertionError
    #         self.log_message("After feedback_delay")
    #         if not isinstance(feedback_map, tuple):
    #             self.log_message("Before assertionerror")
    #             raise AssertionError
    #             success = False
    #             feedback_rule = None
    #             feedback_rule = control.message_type() is MIDI_NOTE_TYPE and Live.MidiMap.NoteFeedbackRule()
    #             feedback_rule.note_no = control.message_identifier()
    #             feedback_rule.vel_map = feedback_map
    #         elif control.message_type() is MIDI_CC_TYPE:
    #             feedback_rule = Live.MidiMap.CCFeedbackRule()
    #             feedback_rule.cc_no = control.message_identifier()
    #             feedback_rule.cc_value_map = feedback_map
    #         elif control.message_type() is MIDI_PB_TYPE:
    #             feedback_rule = Live.MidiMap.PitchBendFeedbackRule()
    #             feedback_rule.value_pair_map = feedback_map
    #         if not feedback_rule != None:
    #             raise AssertionError
    #             feedback_rule.channel = control.message_channel()
    #             feedback_rule.delay_in_ms = feedback_delay
    #             success = control.message_type() is MIDI_NOTE_TYPE and Live.MidiMap.map_midi_note_with_feedback_map(midi_map_handle, parameter, control.message_channel(), control.message_identifier(), feedback_rule)
    #         elif control.message_type() is MIDI_CC_TYPE:
    #             success = Live.MidiMap.map_midi_cc_with_feedback_map(midi_map_handle, parameter, control.message_channel(), control.message_identifier(), control.message_map_mode(), feedback_rule, not control.needs_takeover(), control.mapping_sensitivity)
    #         elif control.message_type() is MIDI_PB_TYPE:
    #             success = Live.MidiMap.map_midi_pitchbend_with_feedback_map(midi_map_handle, parameter, control.message_channel(), feedback_rule, not control.needs_takeover())
    #         elif control.message_type() is MIDI_SYSEX_TYPE:
    #             success = True
    #         success and Live.MidiMap.send_feedback_for_parameter(midi_map_handle, parameter)
    #     self.log_message("End of mapping. Success = " + str(success))
    #     return success

    # def _install_forwarding(self, midi_map_handle, control):
    #     success = None
    #     self.log_message("About to start forwarding - " + str(self._in_build_midi_map.value))
    #     if not self._in_build_midi_map:
    #         self.log_message("Time to forward!")
    #         #raise AssertionError
    #         raise control != None or AssertionError
    #         if not isinstance(control, InputControlElement):
    #             raise AssertionError
    #             success = False
    #             success = control.message_type() is MIDI_NOTE_TYPE and Live.MidiMap.forward_midi_note(self._c_instance.handle(), midi_map_handle, control.message_channel(), control.message_identifier())
    #         elif control.message_type() is MIDI_CC_TYPE:
    #             success = Live.MidiMap.forward_midi_cc(self._c_instance.handle(), midi_map_handle, control.message_channel(), control.message_identifier())
    #         elif control.message_type() is MIDI_PB_TYPE:
    #             success = Live.MidiMap.forward_midi_pitchbend(self._c_instance.handle(), midi_map_handle, control.message_channel())
    #         else:
    #             raise control.message_type() == MIDI_SYSEX_TYPE or AssertionError
    #             success = True
    #         forwarding_keys = success and control.identifier_bytes()
    #         for key in forwarding_keys:
    #             registry = self._forwarding_registry if control.message_type() != MIDI_SYSEX_TYPE else self._forwarding_long_identifier_registry
    #             raise key not in registry.keys() or AssertionError, 'Registry key %s registered twice. Check Midi messages!' % str(key)
    #             registry[key] = control
    #             self.log_message("Registry: " + str(registry))

    #     return success

    def receive_midi(self, midi_bytes):
        #self.log_message("Received midi! " + str(midi_bytes))
        self.requestLoop()
        ControlSurface.receive_midi(self, midi_bytes)

    def suggest_map_mode(self, cc_no, channel):
        return Live.MidiMap.MapMode.absolute

    def update_display(self):
        #Call the pyro request handler so that messages will always be accepted
        self.requestLoop()
        ControlSurface.update_display(self)

    def requestLoop(self):
        self.subscriber.handle_requests()

    def set_encoder_value(self, parametertuple, value):
        self.log_message("Setting encoder " + str(parametertuple) + " to " + str(value))
        self.encoders[parametertuple].mapped_parameter().value = value
        #self.encoders[parametertuple].receive_value(value)
        #self.encoders[parametertuple].notify_value(value)
        self.log_message("--------------------")

    def build_wrappers(self):
        debug_log(self, "Creating clip controls")
        channel = 0
        cc = 2

        # self.clock1 = EncoderElement( MIDI_CC_TYPE, 0, 0, Live.MidiMap.MapMode.absolute)
        self.clock = PyroEncoderElement( 0, 1, None, (0,0,1))
        # self.clock3 = EncoderElement( MIDI_CC_TYPE, 1, 0, Live.MidiMap.MapMode.absolute)
        # self.clock4 = EncoderElement( MIDI_CC_TYPE, 1, 1, Live.MidiMap.MapMode.absolute)
        parameters = {}
        for trackindex in range(len(getTracks())):
            trackWrapper = PyroTrack(trackindex, self.publisher)
            self.tracks.append(trackWrapper)

            for deviceindex in range(len(getTrack(trackindex).devices)):
                deviceWrapper = PyroDevice(trackindex, deviceindex, self.publisher)
                trackWrapper.devices.append(deviceWrapper)

                for parameterindex in range(len(getTrack(trackindex).devices[deviceindex].parameters)):
                    
                    # if trackindex == 0 and deviceindex == 0 and parameterindex == 1:
                    self.log_message("Channel:" + str(channel) + " CC:" + str(cc))
                    parameterWrapper = PyroDeviceParameter(trackindex, deviceindex, parameterindex, self.publisher)
                    parameters[(trackindex, deviceindex, parameterindex)] = parameterWrapper

                    # parameterId = (trackindex, deviceindex, parameterindex)
                    # parameter = getTrack(trackindex).devices[deviceindex].parameters[parameterindex]
                    # encoder = PyroEncoderElement(channel, cc, parameter, parameterId)
                    # encoder.set_publisher(self.publisher)
                    # encoder.set_debugger(self.log_message)
                    # self.encoders[(trackindex, deviceindex, parameterindex)] = encoder


                    cc += 1
                    if cc % 128 == 0:
                        channel += 1
                        cc = 0
                    if not in_range(channel, 0, 16):
                        raise AssertionError

                    # self.log_message("Channel:" + str(channel) + " CC:" + str(cc))
        self.subscriber.parameters = parameters
        self.refresh_state()
