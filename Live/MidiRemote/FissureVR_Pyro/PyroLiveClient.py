import Pyro.util
import Pyro.core

from Pyro.errors import NamingError

import PyroServerStarter
import LiveSubscriber
import zmq

import sys
sys.path.append("/Users/mystfit/Code/zmqshowtime")
from zst_node import ZstNode

#Server startup
PyroServerStarter.startServer()

#Event listener
Pyro.core.initClient()

connector = None
print "Looking for Live remote connection..."

while not connector:
    try:
        connector = Pyro.core.getProxyForURI("PYRONAME://:LivePyro.connector")
    except:
        pass

print "...found connector"
print "Starting listener..."

try:
    listener = LiveSubscriber.LiveSubscriber(connector)

    while True:
        listener.handleRequests()
    print '...listener active!'
except NamingError:
    print 'Cannot find service. Is the Event Service running?'
