import sys
import Pyro.util
import Pyro.core
from Pyro.errors import NamingError
import PyroServerStarter
from LiveRouter import LiveRouter


if len(sys.argv) < 2:
    print "Need a ZST stage address."
    sys.exit(0)

#Server startup
PyroServerStarter.startServer()

#Event listener
Pyro.core.initClient()

router = LiveRouter(sys.argv[1])

try:
    while True:
        router.handle_requests()
except NamingError:
    print 'Cannot find service. Is the Event Service running?'
