import sys
import Pyro.util
import Pyro.core
from Pyro.errors import NamingError
import PyroServerStarter
import LiveSubscriber


if len(sys.argv) < 2:
    print "Need a ZST stage address."
    sys.exit(0)

#Server startup
PyroServerStarter.startServer()

#Event listener
Pyro.core.initClient()

connector = None
listener = LiveSubscriber.LiveSubscriber(sys.argv[1])
print "Looking for Live remote connection..."

while not connector:
    try:
        connector = Pyro.core.getProxyForURI("PYRONAME://:LivePyro.connector")
    except:
        pass

print "...found connector. Starting listener."
listener.live = connector

try:
    while True:
        listener.handle_requests()
except NamingError:
    print 'Cannot find service. Is the Event Service running?'
