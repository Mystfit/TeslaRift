from __future__ import with_statement

# Import std python libs
import sys
import encodings

# Append Pyro and missing standard python scripts to the path
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5")
sys.path.append("/System/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/lib-dynload")
sys.path.append("/Library/Python/2.5/site-packages")

# Import pyro
import Pyro.naming
import Pyro.core
from Pyro.errors import PyroError, NamingError
Pyro.config.PYRO_STORAGE = "/tmp"

# Import Live libraries
import Live
from _Framework.ControlSurface import ControlSurface
from _Framework.InputControlElement import *
from _Framework.ButtonElement import ButtonElement
from _Framework.DeviceComponent import DeviceComponent
from _Framework.EncoderElement import EncoderElement
from _Framework.SessionComponent import SessionComponent
from _Framework.MixerComponent import MixerComponent
from _Framework.ClipSlotComponent import ClipSlotComponent

# Import custom live objects
from LiveUtils import *
from ControlSurfaceComponents.PyroButtonElement import PyroButtonElement
from ControlSurfaceComponents.PyroClipSlotComponent import PyroClipSlotComponent
from ControlSurfaceComponents.PyroEncoderElement import PyroEncoderElement
import LiveConnector


class FissureVR_Pyro(ControlSurface):

    def __init__(self, c_instance):
        ControlSurface.__init__(self, c_instance)
        with self.component_guard():
            self.cInstance = c_instance

            debug_log(self, "--------------------------")
            debug_log(self, "FissureVR Pyro DEBUG_START")
            self._suppress_send_midi = True

            self.initPyroServer()
            self.build_session()
            self.build_clip_controls()
            # self.build_devices()

    def initPyroServer(self):
        Pyro.core.initServer()
        ns = Pyro.naming.NameServerLocator().getNS()
        self.pyrodaemon = Pyro.core.Daemon()
        self.pyrodaemon.useNameServer(ns)

        try:
            ns.createGroup(":LivePyro")
        except NamingError:
            pass

        # Create publisher
        self.publisher = Pyro.core.getProxyForURI("PYRONAME://" + Pyro.constants.EVENTSERVER_NAME)

        # Create remote connector
        self.connector = LiveConnector.LiveConnector()
        uri = self.pyrodaemon.connect(self.connector, ":LivePyro.connector")

        self.connector.init(self.publisher, self.log_message, )
        debug_log(self, "Pyro remote handle URI: " + str(uri))

        # Hook requests to the song timer for max performance. Thanks to Remix.net's LiveOSC module.
        getSong().add_current_song_time_listener(self.requestLoop)

    def disconnect(self):
        self._suppress_send_midi = True
        for control in self.controls:
            if isinstance(control, ButtonElement):
                control.remove_value_listener(self._button_value)

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


    # Building attachments for different controls
    # -------------------------------------------
    def build_session(self):    
        self.mixer = MixerComponent(len(getSong().tracks), len(getSong().return_tracks))
        self.session = SessionComponent()
        self.session.set_mixer(self.mixer)

    def build_clip_controls(self):
        debug_log(self, "Creating Session Controls")
        for track in self.session.tracks_to_use():
            track.add_fired_slot_index_listener(self.connector.track_fired_slot)

    # def build_devices(self):
    #     debug_log(self, "Creating Device components")

    #     for track in self.session.tracks_to_use():
    #         for device in track.devices:
    #             deviceComponent = DeviceComponent()
    #             deviceComponent.set_device(device)
    #             deviceComponent.name = device.name + "_Component"

    #             #self.controls.append(deviceComponent)
    #             #self.pyro.remote_log(str(deviceComponent.name))
    #             encoderId = 0
    #             parameter_encoders = []

    #             for parameter in device.parameters:
    #                 encoder = PyroEncoderElement(MIDI_CC_TYPE, 1, 0, Live.MidiMap.MapMode.absolute)

    #                 encname = (str(encoderId) + "-" + str(device.name) + "-" + str(parameter.name) + "-encoder").replace(" ", "_")
    #                 encoder.name = encname
    #                 parameter_encoders.append(encoder)

    #                 #Create remote instance of this control
    #                 encoderRemoteId = self.pyro.create_remote_control(encname)
    #                 debug_log(self, "Requesting control " + encoderRemoteId)
    #                 encoderRemote = remote_nons.get_server_object(encoderRemoteId, 'localhost', self.PYRO_PORT)
    #                 debug_log(self, "Got control " + encoderRemote.getId())

    #                 encoder.set_remote(encoderRemote)
    #                 encoder.set_debugger(self.log_message)
    #                 encoder.connect(parameter)

    #                 encoderId += 1

    #             deviceComponent.set_parameter_controls(tuple(parameter_encoders))
