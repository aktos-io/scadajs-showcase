require! 'dcs': {Actor, TCPProxyClient}
require! 'aea': {sleep, pack}
require! './omron-fins-client': {OmronFinsClient}
require! '../servers/configuration': {dcs-port}

class Simulator extends Actor
    ->
        super ...
        @subscribe "io.my1.**"
        @on \data, (msg) ~>
            @log.log "simulator got message: #{pack msg.payload}"

    action: ->
        @log.log "Simulator started..."
        x = no
        do ~>
            <~ :lo(op) ~>
                @log.log "sending: #{x}"
                @send {write: {bit: 0, val: x}}, "io.my1.write"
                x := not x
                <~ sleep 2000ms
                lo(op)




#new Simulator!
new OmronFinsClient {name: \my1}
new TCPProxyClient port: dcs-port .login {user: "monitor", password: "test"}
