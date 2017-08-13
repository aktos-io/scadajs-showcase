# -----------------------------------------------------------------------------
# Webserver
# -----------------------------------------------------------------------------
require! <[ fs path express ]>
require! './configuration': {webserver-port}

pub-dir = "#{__dirname}/../scada.js/build/"
app = express!
http = require \http .Server app

# for debugging purposes, print out what is requested
app.use (req, res, next) ->
        filename = path.basename req.url
        extension = path.extname filename
        #console.log "File: #{filename} was requested."
        next!

console.log "serving static folder: /"
app.use "/", express.static path.resolve "#{pub-dir}/showcase"

http.listen webserver-port, ->
    console.log "listening on *:#{webserver-port}"

process.on 'SIGINT', ->
    console.log 'Received SIGINT, cleaning up...'
    process.exit 0


# -----------------------------------------------------------------------------
# DCS
# -----------------------------------------------------------------------------
require! 'dcs': {TCPProxyServer, SocketIOServer}
require! './database': {db}
require! './configuration': {dcs-port}

# create socket.io server
new SocketIOServer http, do
    db: db

# start a TCP Proxy to share messages over dcs network
new TCPProxyServer do
    db: db
    port: dcs-port
