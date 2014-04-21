from __future__ import with_statement

# Append Pyro and missing standard python scripts to the path
import sys
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5")
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/lib-dynload")
sys.path.append("/Library/Python/2.5/site-packages")

import sys
import encodings
import select

# Import pyro
import Pyro.naming
import Pyro.errors
import Pyro.core
Pyro.config.PYRO_STORAGE = "/tmp"

# Import Live libraries
import Live
from _Framework.ControlSurface import ControlSurface

# Import custom live objects
from LiveUtils import *
from ControlSurfaceComponents import *
from LiveWrappers import *
from LiveSubscriber import LiveSubscriber


class FissureVR_Pyro(ControlSurface):

    def __init__(self, c_instance):
        ControlSurface.__init__(self, c_instance)
        with self.component_guard():
            self.cInstance = c_instance

            debug_log(self, "--------------------------")
            debug_log(self, "FissureVR Pyro DEBUG_START")
            self._suppress_send_midi = True

            # Wrappers for Ableton objects
            self.tracks = []
            self.parameters = []

            self.initPyroServer()
            self.build_wrappers()

    def initPyroServer(self):
        Pyro.config.PYRO_ES_BLOCKQUEUE = False

        # Event listener
        Pyro.core.initClient()

        # Create publisher
        self.publisher = Pyro.core.getProxyForURI("PYRONAME://" + Pyro.constants.EVENTSERVER_NAME)
        self.subscriber = LiveSubscriber(self.log_message)

        # Hook requests to the song timer for max performance. Thanks to Remix.net's LiveOSC module.
        getSong().add_current_song_time_listener(self.requestLoop)

    def disconnect(self):
        self._suppress_send_midi = True
        self._suppress_send_midi = False
        ControlSurface.disconnect(self)

    def update_display(self):
        #Call the pyro request handler so that messages will always be accepted
        self.requestLoop()
        ControlSurface.update_display(self)

    def requestLoop(self):

        #self.pyrodaemon.handleRequests(0)
        self.subscriber.handle_requests()

    def build_wrappers(self):
        debug_log(self, "Creating clip controls")
        for trackindex in range(len(getTracks())):
            trackWrapper = PyroTrack(trackindex, self.publisher)
            self.tracks.append(trackWrapper)

            for deviceindex in range(len(getTrack(trackindex).devices)):
                deviceWrapper = PyroDevice(trackindex, deviceindex, self.publisher)
                trackWrapper.devices.append(deviceWrapper)

                for parameterindex in range(len(getTrack(trackindex).devices[deviceindex].parameters)):
                    parameterWrapper = PyroDeviceParameter(trackindex, deviceindex, parameterindex, self.publisher)
                    deviceWrapper.parameters.append(parameterWrapper)
