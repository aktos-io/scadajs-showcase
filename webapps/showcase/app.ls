require! 'prelude-ls': {group-by, sort-by}
require! components
require! './login'
require! './scada-components'
require! './erp-components'
require! './authorization'
require! './example'

# optional, just for testing
require! 'aea': {sleep}

try
    ractive = new Ractive do
        el: \body
        template: RACTIVE_PREPARSE('app.pug')
        oninit: ->
            @on do
                'complete': ->
                    <~ sleep 10ms # This is only to verify that menu can be set after completion
                    @set \menu, @get \menuLinks

                    # initialize sidebar
                    $ '.ui.sidebar' .sidebar!
        data:
            dcs: {}
            login:
                user: ''
                password: ''
                loggedin: no
                token: null
            menu: []
            menu-links: do ->
                menu =
                    * title: 'Scada Components'
                      url: '#/scada-components'
                      submenu:
                          * title: 'Progress Bar'
                            url: '#progress'
                          * title: 'Slider'
                            url: '#slider'
                          * title: 'Drawing Area'
                            url: '#drawing-area'
                    * title: 'ERP Components'
                      url: '#/erp-components'
                      submenu: do ->
                        components =
                            'ack-button'
                            'checkbox'
                            'data-table'
                            'csv-importer'
                            'date-picker'
                            'dropdown-panel'
                            'dropdown'
                            'file-read'
                            'formal-field'
                            'input-field'
                            'print-button'
                            'r-table'
                            'text-button'
                            'todo'
                        [{title: .., url: "\##{..}"} for components]
                    * title: 'Authorization Test'
                      url: '#/authorization-test'
                    * title: 'Example Component'
                      url: '#/example'
                      icon: 'cube'

catch
    console.log "Error in new Ractive: ", e
