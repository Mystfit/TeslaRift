from __future__ import with_statement

# Append Pyro and missing standard python scripts to the path
import sys
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5")
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/lib-dynload")
sys.path.append("/Library/Python/2.5/site-packages")

import encodings

# Import pyro
import Pyro.naming
import Pyro.errors
import Pyro.core
Pyro.config.PYRO_STORAGE = "/tmp"

# Import Live libraries
import Live
from _Framework.ControlSurface import ControlSurface
from _Framework.EncoderElement import EncoderElement

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
            self.cInstance = c_instance
            self._suppress_send_midi = True

            debug_log(self, "--------------------------")
            debug_log(self, "FissureVR Pyro DEBUG_START")

            # Wrappers for Ableton objects
            self.song = None
            self.tracks = []
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
        self.subscriber = LiveSubscriber(self.publisher, self.log_message)

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

    def build_wrappers(self):
        debug_log(self, "Creating Live/Pyro wrappers")

        self.subscriber.set_song(PyroSong(self.publisher))

        self.clock = PyroEncoderElement( 0, 1, None, (0, 0, 1))
        parameters = {}
        for trackindex in range(len(getTracks())):
            trackWrapper = PyroTrack(trackindex, self.publisher)
            self.tracks.append(trackWrapper)

            for deviceindex in range(len(getTrack(trackindex).devices)):
                deviceWrapper = PyroDevice(trackindex, deviceindex, self.publisher)
                trackWrapper.devices.append(deviceWrapper)

                for parameterindex in range(len(getTrack(trackindex).devices[deviceindex].parameters)):                    
                    parameterWrapper = PyroDeviceParameter(trackindex, deviceindex, parameterindex, self.publisher)
                    parameters[(trackindex, deviceindex, parameterindex)] = parameterWrapper

        self.subscriber.set_parameter_list(parameters)
        self.refresh_state()
