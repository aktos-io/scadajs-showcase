require! 'aea': {sleep}
require! 'dcs/browser': {Actor}

Ractive.components['example'] = Ractive.extend do
    template: RACTIVE_PREPARSE('index.pug')
    isolated: no
    oninit: ->
        fan = new Actor \myfan
        fan.subscribe \io.my1.**
        fan.on \data, (msg) ->
            console.log "fan return value: ", msg

        @on do
            toggleFan: (context, value) ->
                context.component.fire \state, \doing
                fan.send {write: {bit: 0, val: value}}, "io.my1.write"
                @set \fanState, not value
                context.component.fire \state, \done
    data: ->
        fanState: off
