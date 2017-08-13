# Adding New Scene (as a component)

### Required

1. Create directory $scene

2. Create template file: $scene/index.pug

        h2 Hello from $scene

3. Create js file: $scene/index.ls

        Ractive.components['$scene'] = Ractive.extend do
            template: RACTIVE_PREPARSE('index.pug')
            isolated: no
            onrender: ->
                ...

4. Add this component into `app.ls`

        require! './$scene'

5. Add this scene into main template (`app.pug`):

        .ui.grid
            scene(name="$scene" curr="{{currentPage}}")
                $scene

### Optional

6. Add any assets into the `$scene/assets` folder.

7. Add to menu.
