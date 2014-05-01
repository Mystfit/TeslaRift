try:
    from LiveUtils import *
except ImportError:
    print "Couldn't import LiveUtils!"

import Pyro.errors

INCOMING_PREFIX = "I_"
OUTGOING_PREFIX = "O_"


class PyroSong():

    # Out
    GET_SONG_LAYOUT = "get_song_layout"

    def __init__(self, publisher):
        self.publisher = publisher

    def get_song_layout(self, args=None):
        song = {"tracks": [], "returns": []}

        for track in getTracks():
            trackObj = {"name": track.name, "devices": []}
            for device in track.devices:
                deviceObj = {"name": device.name, "parameters": []}
                for parameter in device.parameters:
                    paramObj = {
                        "name": parameter.name,
                        "min": parameter.min,
                        "max": parameter.max,
                        "value": parameter.value}
                    deviceObj["parameters"].append(paramObj)
                trackObj["devices"].append(deviceObj)
            song["tracks"].append(trackObj)
        self.publisher.publish_check(
            OUTGOING_PREFIX + PyroSong.GET_SONG_LAYOUT, song)


class PyroTrack():
    # Out
    FIRED_SLOT_INDEX = "fired_slot_index"
    PLAYING_SLOT_INDEX = "playing_slot_index"

    # In
    FIRE_CLIP = "fire_clip"

    def __init__(self, trackindex, publisher):
        self.trackindex = trackindex
        self.track = getTrack(trackindex)
        self.publisher = publisher
        self.devices = []

        # Listeners
        self.track.add_fired_slot_index_listener(self.fired_slot_index)
        self.track.add_playing_slot_index_listener(self.playing_slot_index)

    def fired_slot_index(self):
        self.publisher.publish_check(OUTGOING_PREFIX + PyroTrack.FIRED_SLOT_INDEX, {
            "track": self.track.name,
            "slotindex": self.track.fired_slot_index})

    def playing_slot_index(self):
        self.publisher.publish_check(PyroTrack.PLAYING_SLOT_INDEX, {
            "track": self.track.name,
            "slotindex": self.track.playing_slot_index})


class PyroDevice():
    # Out
    PARAMETERS_UPDATED = "parameters_updated"

    def __init__(self, trackindex, deviceindex, publisher):
        self.trackindex = trackindex
        self.deviceindex = deviceindex
        self.device = getTrack(trackindex).devices[deviceindex]
        self.publisher = publisher
        self.parameters = []

        self.device.add_parameters_listener(self.parameters_updated)

    def parameters_updated(self):
        self.publisher.publish_check(OUTGOING_PREFIX + PyroDevice.PARAMETERS_UPDATED, {
            "track": self.track.name,
            "device": self.device.name})


class PyroDeviceParameter():
    # Out
    VALUE_UPDATED = "value_updated"
    SET_VALUE = "set_value"

    def __init__(self, trackindex, deviceindex, parameterindex, publisher):
        self.trackindex = trackindex
        self.deviceindex = deviceindex
        self.parameterindex = parameterindex
        self.publisher = publisher

        self.get_parameter().add_value_listener(self.value_updated)

    def get_parameter(self):
        return getTrack(self.trackindex).devices[self.deviceindex].parameters[self.parameterindex]

    def value_updated(self):
        self.publisher.publish_check(OUTGOING_PREFIX + PyroDeviceParameter.VALUE_UPDATED, {
            "trackindex": self.trackindex,
            "deviceindex": self.deviceindex,
            "parameterindex": self.parameterindex,
            "value": self.get_parameter().value})
