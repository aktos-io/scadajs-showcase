require! 'aea':{sleep}

Ractive.components['login'] = Ractive.extend do
    template: RACTIVE_PREPARSE('login.pug')
    isolated: no
    onrender: ->
        username-input = $ @find \input.username
        password-input = $ @find \input.password
        login-button = @find-component \login-button
        enter-key = 13

        username-input.on \keyup, (key) ~>
            if key.key-code is enter-key
                password-input.focus!
            <- sleep 1ms
            inp = username-input.val!
            lower = inp.to-lower-case!
            #@set \warnCapslock, (inp isnt lower)
            username-input.val lower

        password-input.on \keyup, (key) ->
            if key.key-code is enter-key
                login-button.fire \click

        scene-button = @find-component \redirect-button

        @on do
            success: (ev) ->
                scene-button.fire \click
