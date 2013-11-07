import Live
from _Framework.ControlSurface import ControlSurface
from _Framework.ClipSlotComponent import ClipSlotComponent
from _Framework.SceneComponent import SceneComponent


class FissureVR(ControlSurface):

    def __init__(self, c_instance):
        ControlSurface.__init__(self, c_instance)

        self.log_message("FissureVR DEBUG_START")
        self.log_message("-----------------------------------------------")
        self.cInstance = c_instance

        # Add listeners
        if self.cInstance.song().tracks_has_listener(self.tracks_updated) != 1:
            self.cInstance.song().add_tracks_listener(self.tracks_updated)

        self.add_clipslot_listeners()

    def disconnect(self):
        rem_tracks_listener()
        rem_clipslot_listeners()

    def add_tracks_listener(self):
        self.rem_tracks_listener()

        if self.cInstance.song().tracks_has_listener(self.tracks_updated) != 1:
            self.cInstance.song().add_tracks_listener(self.tracks_updated)

    def add_clipslot_listeners(self):
        self.rem_clipslot_listeners()

        for track in self.cInstance.song().tracks:
            for clipSlot in track.clip_slots:
                clipSlot.add_has_clip_listener(self.tracks_updated)


    def rem_tracks_listener(self):
        if self.song().tracks_has_listener(self.tracks_updated) == 1:
            self.song().remove_tracks_listener(self.tracks_updated)

    def rem_clipslot_listeners(self):
        for track in self.cInstance.song().tracks:
            for clipSlot in track.clip_slots:
                if( clipSlot.has_clip_has_listener(self.tracks_updated) ):
                    clipSlot.remove_has_clip_listener(self.tracks_updated)

    def tracks_updated(self):
        self.log_message("Tracks updated")
        self.DumpSongDetails()

    def DumpSongDetails(self):

        xmlString = "<?xml version='1.0' encoding='UTF-8'?>\n"
        xmlString += "<song tempo = '" + \
            str(self.cInstance.song().tempo) + "'>\n"
        trackChannel = 0

        # iterate through the tracks
        for myTrack in self.cInstance.song().tracks:
            trackChannel += 1

            try:
                myTrackMixer = myTrack.mixer_device
                xmlString += "\t<track channel='" + str(trackChannel) + "' name='" + str(myTrack.name) + "' volume='" + str(myTrackMixer.volume) + "' pan='" + str(
                    myTrackMixer.panning) + "' output_meter_level='" + str(myTrack.output_meter_level) + "' mute='" + str(myTrack.mute) + "' solo='" + str(myTrack.solo) + "' arm='" + str(myTrack.arm) + "' color='" + str(myTrack.color) + "'>\n"

                clipIndex = 0

                # iterate through clips of a track
                for myClipSlot in myTrack.clip_slots:
                    clipIndex += 1

                    if (myClipSlot.has_clip):
                        try:
                            myClip = myClipSlot.clip
                            xmlString += "\t\t<clip index='" + str(clipIndex) + "' name='" + myClip.name + "' color='" + str(myClip.color) + "' mute='" + \
                                str(myClip.muted) + "' looping='" + str(myClip.looping) + "' playing='" + \
                                str(myClip.is_playing) + "' triggered='" + \
                                str(myClip.is_triggered) + \
                                "' />\n"
                        except:
                            self.log_message("!! error parsingclip !!")

                # get sends
                for mySends in myTrackMixer.sends:
                    xmlString += "\t\t<sends name='" + \
                        str(mySends.name) + "' value='" + str(
                            mySends.value) + "' min='" + str(mySends.min) + "' max='" + str(mySends.max) + "' />\n"

                # iterate through the device chain of a track
                # get the devices and the associated parameters
                for myDevice in myTrack.devices:
                    try:
                        xmlString += "\t\t<device name='" + \
                            str(myDevice.name) + "'>\n"
                    except:
                        self.log_message("!! error parsing Device !!")

                    for myParameter in myDevice.parameters:
                        try:
                            xmlString += "\t\t\t<parameter name='" + str(myParameter.name) + "' value='" + str(
                                myParameter.value) + "' min='" + str(myParameter.min) + "' max='" + str(myParameter.max) + "'/>\n"
                        except:
                            self.log_message("!! error parsing Parameter!!")

                    xmlString += "\t\t</device>\n"

                xmlString += "\t</track>\n"

            except:
                self.log_message("!! error parsing track !!")

        # represent the Return Track
        for myReturnTrack in self.cInstance.song().return_tracks:
            try:
                myReturnTrackMixer = myReturnTrack.mixer_device
                xmlString += "\t<trackReturn name='" + str(myReturnTrack.name) + "' volume='" + str(myReturnTrackMixer.volume) + "' pan='" + str(
                    myReturnTrackMixer.panning) + "' output_meter_level='" + str(myReturnTrack.output_meter_level) + "' mute='" + str(myReturnTrack.mute) + "' solo='" + str(myReturnTrack.solo) + "' color='" + str(myReturnTrack.color) + "'>\n"

                # iterate through the device chain of a track
                # get the devices and the associated parameters
                for myReturnDevice in myReturnTrack.devices:
                    try:
                        xmlString += "\t\t<device name='" + \
                            str(myReturnDevice.name) + "'>\n"
                    except:
                        self.log_message("!! error parsing return Device !!")

                    for myReturnParameter in myReturnDevice.parameters:
                        try:
                            xmlString += "\t\t\t<parameter name='" + str(myReturnParameter.name) + "' value='" + str(
                                myReturnParameter.value) + "' min='" + str(myReturnParameter.min) + "' max='" + str(myReturnParameter.max) + "'/>\n"
                        except:
                            self.log_message(
                                "!! error parsing return Parameter!!")
                    xmlString += "\t\t</device>\n"

                xmlString += "\t</trackReturn>\n"
            except:
                self.log_message("!! error parsing return !!")

        # represent the Master Track
        try:
            myMasterTrack = self.cInstance.song().master_track
            myMasterTrackMixer = myMasterTrack.mixer_device
            xmlString += "\t<trackMaster name='" + str(myMasterTrack.name) + "' volume='" + str(myMasterTrackMixer.volume) + "' pan='" + str(
                myMasterTrackMixer.panning) + "' output_meter_level='" + str(myMasterTrack.output_meter_level) + "' color='" + str(myMasterTrack.color) + "'>\n"

            # iterate through the device chain of a track
            # get the devices and the associated parameters
            for myMasterDevice in myMasterTrack.devices:
                try:
                    xmlString += "\t\t<device name='" + \
                        str(myMasterDevice.name) + "'>\n"
                except:
                    self.log_message("!! error parsing return Device !!")

                for myMasterParameter in myMasterDevice.parameters:
                    try:
                        xmlString += "\t\t\t<parameter name='" + str(myMasterParameter.name) + "' value='" + str(
                            myMasterParameter.value) + "' min='" + str(myMasterParameter.min) + "' max='" + str(myMasterParameter.max) + "'/>\n"
                    except:
                        self.log_message("!! error parsing return Parameter!!")

                xmlString += "\t\t</device>\n"
            xmlString += "\t</trackMaster>\n"

        except:
            self.log_message("!! error master return !!")

        xmlString += "</song>\n"

        f = open(
            "/Users/mystfit/Code/TeslaRift/Live/MidiRemote/sessionDump.xml", "w")
        f.write(xmlString)

        #self.log_message(xmlString)
