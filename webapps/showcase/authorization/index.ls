Ractive.components['authorization'] = Ractive.extend do
    template: RACTIVE_PREPARSE('index.pug')
    isolated: no
    data: ->
        hackme: off
