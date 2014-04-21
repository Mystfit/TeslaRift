class PyroTrack():
    # Out
    FIRED_SLOT_INDEX = "fired_slot_index"
    PLAYING_SLOT_INDEX = "playing_slot_index"

    # In
    FIRE_CLIP = "fire_clip"

    def __init__(self, track, publisher):
        self.track = track
        self.publisher = publisher
        self.devices = []

        # Listeners
        self.track.add_fired_slot_index_listener(self.fired_slot_index)
        self.track.add_playing_slot_index_listener(self.playing_slot_index)

    def fired_slot_index(self):
        self.publisher.publish(PyroTrack.FIRED_SLOT_INDEX, {
            "track": self.track.name,
            "slotindex": self.track.fired_slot_index})

    def playing_slot_index(self):
        self.publisher.publish(PyroTrack.PLAYING_SLOT_INDEX, {
            "track": self.track.name,
            "slotindex": self.track.playing_slot_index})


class PyroDevice():
    # Out
    PARAMETERS_UPDATED = "parameters_updated"

    def __init__(self, track, device, publisher):
        self.track = track
        self.device = device
        self.publisher = publisher
        self.parameters = []

        self.device.add_parameters_listener(self.parameters_updated)

    def parameters_updated(self):
        self.publisher.publish(PyroDevice.PARAMETERS_UPDATED, {
            "track": self.track.name,
            "device": self.device.name})


class PyroDeviceParameter():
    # Out
    VALUE_UPDATED = "value_updated"

    def __init__(self, track, device, parameter, publisher):
        self.track = track
        self.device = device
        self.parameter = parameter
        self.publisher = publisher

        self.parameter.add_value_listener(self.value_updated)

    def value_updated(self):
        self.publisher.publish(PyroDeviceParameter.VALUE_UPDATED, {
            "track": self.track.name,
            "device": self.device.name,
            "parameter": self.parameter.name,
            "value": self.parameter.value})
