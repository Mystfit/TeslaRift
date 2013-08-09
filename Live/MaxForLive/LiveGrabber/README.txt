LiveGrabber
The LiveGrabber plugins are a set of Max For Live plugins that send device parameters, track parameters, clip envelopes and audio analysis information from Ableton Live to any device on the network that supports Open Sound Control (OSC). 

As of version 3, LiveGrabber also allows the reverse: controlling Ableton Live with OSC.

Changes in version 3.1:
- Fixed storing AnalysisGrabber filter frequency
- Replaced the OSC-route object with the new Max 6 route for better cross platform support

Changes in version 3.0:
- Now includes reverse operation: controlling Live with OSC. Added GrabberReceiver plugin.

Also:
- Added auto-detecting OSC devices via Bonjour: LiveGrabber announces itself as a sender in GrabberSender and detects available senders in GrabberReceiver
- Added sending via a specific network interface. 
- Renamed internal send/receive to have unique names. Mixing 3.0 with earlier versions will not work (!)
- Added learning incoming messages. The addresses of latest 8 incoming messages are listed in the address dropdown menu for parameters of receiving-enabled plugins (ParamGrabber and TrackGrabber)


Changes in version 2.8:

- Fixed problem in AnalysisGrabber: Triggers would not be sent. 
- Fixed problem in AnalysisGrabber: Hi Follower interfered with Mid Trigger.
- AnalysisGrabber UI updates: envelopes are no longer clickable, added Foll and Trig labels.

Thanks to maotik for the bug report and thanks to Karl Kliem for isolating the problem.


Changes in version 2.7:

- Added VoidGrabber
- Slightly changed GUI real estate of all plugins, e.g. OSC address fields are a little larger
- Names of Rack parameters are now displayed correctly in ParamGrabber
- TrackGrabber now displays an error message when inside a Rack
- Readme now says that you can have more than one grabbersender.


Changes in version 2.6:

- Added AnalysisGrabber
- ParamGrabber now recognizes when it's dragged into or outside of a rack and refreshes accordingly
- ParamGrabber no longer resets its dropdowns if the effects stack is changed but the effect it is linked to remains the same.
- When Sender Name is left empty in the GrabberSender, no address node is prepended.


Changes in version 2.5:

- Fixed initialization for versions of Live older than 8.2.2.
- Devices are now frozen, making sure to include proper externals.


Changes in version 2.4:

- Learn button in ParamGrabber.
- ParamGrabber amd TrackGrabber check for existence of GrabberSender, if not found they display a warning in red.
- More Live-like visual style, making room for 1 more parameter in ParamGrabber and TrackGrabber.


System requirements

- A computer that runs Ableton Live with Max For Live.
- Any software or hardware device that supports Open Sound Control input or output.


How to use

ParamGrabber: this plugin connects to parameters of any Live device.

1) In Ableton Live, select a track that contains at least one audio effect.
2) Drag the ParamGrabber plugin to the effect area of your track in Live and position it next to the plugin of which you want to grab the parameters. You can repeat this for multiple effects on multiple tracks.
3) In one of the drop-down menus, select the parameter you want to communicate via OSC. In the text field next to it, add the address you want to send your parameter value to. You can repeat this for multiple parameters.


TrackGrabber: this plugin connects to track parameters of a Live track.

1) Select a track.
2) Drag the TrackGrabber plugin to the effect area of a track in Live and position it anywhere you want.
3) In one of the drop-down menus, select the parameter you want to communicate via OSC. In the text field next to it, add the address you want to send your parameter value to.
--OR--
4) Press the Learn button, then touch any parameter of the neighboring plugin to automatically select that parameter in the dropdown


AnalysisGrabber: this plugin analyses the audio output of a Live track.

1) Select an audio track.
2) Drag the AnalysisGrabber plugin to the effect area and position it anywhere between your effects. To achieve optimal analysis accuracy, you should typically position it before any reverb module or other effects that smooth out transients.
3) In one of the drop-down menus, select one of the six parameters. In the text field next to it, add the address you want to send your parameter value to. Note that the Envelope parameters are sent periodically (25 times per second by default), the Trigger parameters output on every detected trigger.


VoidGrabber: this plugin allows you to send arbitrary values with Automation and Clip Envelops.

1) Select a track.
2) Drag the VoidGrabber plugin to the audio effect area of the track, the position relative to other effects doesn't influence its behavior.
3) Decide which parameter you want to use to send values to your destination. In the text field next to it, add the address you want to send your parameter value to.
4) To control this parameter with Clip Envelopes, add a clip in the selected track and double-click it to switch to the Clip View. In the left-bottom corner you will find the small E button that opens the Envelopes box. In the Device Chooser dropdown, select VoidGrabber. In the dropdown below, select your parameter. You can now start drawing your clip envelope, which will be sent out to you OSC destination. 

Note: the value sent out by your Clip Envelope will be scaled by the Automation value of the control. Keep the slider value at 1 to send an envelope output value without extra scaling.


GrabberSender: this plugin sends all data to your OSC destination on the network.

1) Drag the GrabberSender plugin to the Master track in Live.
2) Set the IP address and port number to the IP and port of your destination. Alternatively, if your OSC destination supports Bonjour, select it from the Bonjour dropdown menu.

Note: you can have more than one GrabberSender per live set, in case you want to send to multiple destinations.


GrabberReceiver: this plugin receives messages from your OSC sender on the network.

1) Drag the GrabberReceiver plugin to the Master track in Live.
2) In your OSC sender, define the Live set as your destination by selecting the IP address of the computer Live runs on and the port number found in GrabberReceiver (2345 by default). Alternatively, if your OSC sender supports Bonjour, you can select the Bonjour Name found in GrabberReceiver (MyLiveSet by default) in your OSC sender. The IP and port will then be set automatically.


For more info and help, please visit http://livegrabber.sourceforge.net/

Made by Mattijs Kneppers (www.arttech.nl)
