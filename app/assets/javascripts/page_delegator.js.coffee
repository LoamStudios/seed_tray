class @PageDelegator
    constructor: (@root) ->
        if window.Turbolinks != undefined
            $(window).on "page:change", => @ready()
        else
            $(@ready)

    # Dynamically delegates ready to controller action specific ready methods
    # based on the classes found on the page
    ready: =>
        #  Run the page specific ready code
        @delegate_ready()

        # Run the code that should run on every page.
        @site_wide_ready()

    delegate_ready: =>
        controller = $("[data-controller]")
        action = $("[data-action")

        if @root[controller] && @root[controller][action]
            @root[controller][action].ready()
            console.log "Executed #{n.controller}##{n.action} ready JS."

    site_wide_ready: ->

    capitalize: (string) ->
        "#{string[0].toUpperCase()}#{string.substring(1)}"

    classify: (css_class) =>
        # connect namespaced controllers
        if css_class.indexOf("-") != -1
            String::concat.apply "", $.map(css_class.split("-"), (c) => @capitalize(c))
        else if css_class.indexOf("_") != -1
            String::concat.apply "", $.map(css_class.split("_"), (c) => @capitalize(c))
        else
            @capitalize(css_class)

    controllers: =>
        classes = document.getElementsByTagName("body")[0].className.split(" ")

        # Convert classes into controller objects
        $.map $.grep(classes, (c) -> c.indexOf("-") != -1), (c) =>
            indexOfHyphen = c.lastIndexOf("-")
            
            controller: @classify(c.slice(0, indexOfHyphen))
            action: @capitalize(c.slice(indexOfHyphen + 1))
