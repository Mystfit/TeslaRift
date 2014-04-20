class PyroTrack():
    def __init__(self, track, connector):
        self.track = track
        self.connector = connector
        self.track.add_fired_slot_index_listener(self.fired_slot_index)
        self.track.add_playing_slot_index_listener(self.playing_slot_index)

    def fired_slot_index(self):
        self.connector.fired_slot_index(self.track.name, self.track.fired_slot_index)
        print "Slot fired!"

    def playing_slot_index(self):
        self.connector.playing_slot_index(self.track.name, self.track.playing_slot_index)
