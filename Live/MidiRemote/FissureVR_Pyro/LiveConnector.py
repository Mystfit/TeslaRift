import Pyro.core
import Pyro.constants


class LiveConnector(Pyro.core.SynchronizedObjBase):

    def init(self, publisher, logger):
        self.tracks = []
        self.launchButtons = []
        self.controls = {}
        self.log_message = logger
        self.publisher = publisher

        Pyro.core.initClient()
        return "Remote init successful"

    def fired_slot_index(self, trackname, value):
        self.publisher.publish("fired_slot_index", {"trackname": trackname, "value": value})

    def playing_slot_index(self, trackname, value):
        self.publisher.publish("playing_slot_index", {"trackname": trackname, "value": value})



    #
    # --------------------------------------------------------------------
    # --------------------------------------------------------------------
    #
    def add_control(self, control):
        self.controls[control.name] = control
        print "Added " + control.name

    def list_controls(self):
        return self.controls.keys()

    def turn_on_clip(self, controlkey):
        self.log_message("Launching clip " + str(controlkey))
        self.log_message(str(self.controls[controlkey]))
        self.controls[controlkey]._clip_slot.fire()

    def remote_log(self, msg):
        self.log_message("Msg:" + str(msg))
