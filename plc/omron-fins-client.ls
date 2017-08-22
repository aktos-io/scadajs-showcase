require! 'dcs': {Actor}
require! 'dcs/src/signal': {Signal}
require! 'aea': {sleep, pack}
require! 'omron-fins': fins
require! 'prelude-ls': {chars, reverse}


export class OmronFinsClient extends Actor
    (@opts) ->
        @name = try @opts.name
        throw 'Fins Client need a name to be subscribed' unless @name

        super @name
        @subscribe "io.#{@name}.**"

        @target = {port: 9600, host: '192.168.250.1'} <<< @opts

        @client = fins.FinsClient @target.port, @target.host

        @read-signal = new Signal!
        @write-signal = new Signal!

        @client.on \reply, (msg) ~>
            if msg.command is \0101
                @read-signal.go msg
            else if msg.command is \0102
                @write-signal.go msg
            else
                @log.log "unknown msg.command: #{msg.command}"
                console.log "reply: ", pack msg


        curr-output = for i in [to 10] => 0
        sync-output = (callback) ~>
            output-int = parse-int (reverse curr-output .join ''), 2
            err, bytes <~ @client.write 'C00100', output-int
            reason, msg <~ @write-signal.wait 5000ms
            #console.log "write message response: #{pack msg}"
            callback!

        '''
        i = 0
        <~ :lo(op) ~>
            curr-output[i++] = 1
            sync-output!
            <~ sleep 1000ms
            lo(op)
        '''

        curr-input = for i in [to 10] => -1
        do ~>
            <~ :lo(op) ~>
                err, bytes <~ @client.read 'C00000', 1
                reason, msg <~ @read-signal.wait 5000ms
                try
                    status = (msg.values.0).to-string 2
                    status = reverse chars "00000000#{status}".slice -8
                    for b of status
                        inp = parse-int status[b]
                        if inp isnt curr-input[b]
                            prev = curr-input[b]
                            curr-input[b] = inp
                            @log.log "bit #{b} is changed: #{inp}"
                            @send {read: {bit: b, val: inp, prev: prev}}, "io.#{@name}.read"
                <~ sleep 500ms
                lo(op)


        @on \data, (msg) ~>
            if \write of msg.payload
                '''
                write:
                    bit: bit to write
                    val: value to write
                '''
                _bit = msg.payload.write.bit
                _val = if msg.payload.write.val => 1 else 0
                #console.log "writing bit #{_bit}, val: #{_val}"
                curr-output[_bit] = _val
                <~ sync-output
                @send {write: {bit: _bit, val: _val}}, "io.#{@name}.write"

            else if \read of msg.payload
                '''
                read:
                    block: 'input' or 'output' to read
                    bit: 'bit to read'
                '''
                _bit = msg.payload.read.bit
                try
                    val = if msg.payload.read.block is \input
                        curr-input[_bit]
                    else if msg.payload.read.block is \output
                        curr-output[_bit]
                    else
                        throw 'invalid block'
                        -1

                    @send {read: {bit: b, val: val}}, "io.#{@name}.read"
                catch
                    @log.log "error for read: #{pack e}"
