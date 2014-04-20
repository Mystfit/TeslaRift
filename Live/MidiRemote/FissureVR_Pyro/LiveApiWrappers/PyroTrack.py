class PyroTrack():
    def __init__(self, track, publisher):
        self.track = track
        self.publisher = publisher
        self.track.add_fired_slot_index_listener(self.fired_slot_index)
        self.track.add_playing_slot_index_listener(self.playing_slot_index)

    def fired_slot_index(self):
        self.publisher.publish("fired_slot_index", {"trackname": self.track.name, "value": self.track.fired_slot_index})

    def playing_slot_index(self):
        self.publisher.publish("playing_slot_index", {"trackname": self.track.name, "value": self.track.playing_slot_index})
