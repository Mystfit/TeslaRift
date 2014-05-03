var http = require('http'),
    fs = require('fs'),
    qs = require('querystring');

var xmlSession = fs.readFileSync(__dirname + "/../MidiRemote/sessionDump.xml", "utf8");
var port = 2350;

// create the http server
http.createServer(function(req, res) {

    // handle the routes
    if (req.method == 'POST') {

        req.on('data', function(chunk) {
            console.log("Received body data");
            xmlSession = qs.unescape(qs.parse(chunk.toString())['sessionXml']);
        });

        res.writeHead(200, {
            'Content-Type': 'text/plain'
        });
        res.end('sent');

    } else {
        res.writeHead(200, {
            'Content-Type': 'text/xml'
        });
        res.end(xmlSession);
    }

}).listen(port);

console.log("Live session server running on port " + port);