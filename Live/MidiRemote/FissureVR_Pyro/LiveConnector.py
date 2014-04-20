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

    def publish_clip_launch(self, clip, value):
        self.publisher.publish("CLIP_EVENT", {"name": clip, "value": value})

    def track_fired_slot(self):
        self.publisher.publish("TRACK_EVENT", {"name": "Some track fired"})

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
