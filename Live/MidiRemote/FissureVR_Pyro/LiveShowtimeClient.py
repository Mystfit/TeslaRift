import sys
import Pyro.util
import Pyro.core
from Pyro.errors import NamingError
import PyroServerStarter
from LiveRouter import LiveRouter
import rtmidi_python as rtmidi
import threading
import time

exitFlag = 0


# The clock class sends a 1ms midi CC message with an incrementing value
# that the Live ControlSurface can use to trigger faster event updates
class Clock(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)

        self.clockVal = 0
        self.midi_out = rtmidi.MidiOut()
        self.midi_out.open_virtual_port("LiveShowtime_Clock")

    def run(self):
        while not exitFlag:
            self.clockVal += 1
            self.clockVal = self.clockVal % 127
            self.midi_out.send_message([0xB0, 1, self.clockVal])
            time.sleep(0.001)


if len(sys.argv) < 2:
    print "Need a ZST stage address."
    sys.exit(0)

#Server startup
PyroServerStarter.startServer()

#Event listener
Pyro.core.initClient()

# Set up midi clock
clock = Clock()
clock.start()

# Set up Pyro/Showtime router
router = LiveRouter(sys.argv[1])

# Enter into the idle loop to handle message
try:
    while True:
        router.handle_requests()
except KeyboardInterrupt:
    print "\nExiting..."
    exitFlag = 1
    clock.join()
