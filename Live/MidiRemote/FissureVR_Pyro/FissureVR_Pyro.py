from __future__ import with_statement

# Import std python libs
import sys

# Append Pyro and missing standard python scripts to the path
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5")
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/lib-dynload")
sys.path.append("/Library/Python/2.5/site-packages")

# Import pyro
import encoding
import Pyro.naming
import Pyro.core
Pyro.config.PYRO_STORAGE = "/tmp"

# Import Live libraries
import Live
from _Framework.ControlSurface import ControlSurface

# Import custom live objects
from LiveUtils import *
from ControlSurfaceComponents import *
from LiveWrappers import *
from LiveIncomingSubscriber import LiveIncomingSubscriber


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
        Pyro.core.initServer()
        ns = Pyro.naming.NameServerLocator().getNS()
        self.pyrodaemon = Pyro.core.Daemon()
        self.pyrodaemon.useNameServer(ns)

        # Event listener
        Pyro.core.initClient()

        try:
            ns.createGroup(":LivePyro")
        except NamingError:
            pass

        # Create publisher
        self.publisher = Pyro.core.getProxyForURI("PYRONAME://" + Pyro.constants.EVENTSERVER_NAME)
        self.subscriber = LiveIncomingSubscriber(self.log_message)

        # Hook requests to the song timer for max performance. Thanks to Remix.net's LiveOSC module.
        getSong().add_current_song_time_listener(self.requestLoop)

    def disconnect(self):
        self._suppress_send_midi = True

        #Kill Pyro server
        self.pyrodaemon.shutdown(True)
        self.requestThread.exit()

        self._suppress_send_midi = False
        ControlSurface.disconnect(self)

    def update_display(self):
        #Call the pyro request handler so that messages will always be accepted
        self.requestLoop()
        ControlSurface.update_display(self)

    def requestLoop(self):
        self.pyrodaemon.handleRequests(0.01)
        self.subscriber.handle_requests()

    def build_wrappers(self):
        debug_log(self, "Creating clip controls")
        for track in getTracks():
            trackWrapper = PyroTrack(track, self.publisher)
            self.tracks.append(trackWrapper)

            for device in track.devices:
                deviceWrapper = PyroDevice(track, device, self.publisher)
                trackWrapper.devices.append(deviceWrapper)

                for parameter in device.parameters:
                    parameterWrapper = PyroDeviceParameter(track, device, parameter, self.publisher)
                    deviceWrapper.parameters.append(parameterWrapper)
