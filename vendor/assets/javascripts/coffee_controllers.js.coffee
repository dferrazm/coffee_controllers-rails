# Top-level object to execute controller action's specific scripts
@Controllers ?= {}
@ActiveController = null

$ ->
  # Run the specific scripts that have to be run after the DOM is loaded
  runSpecificActionScript()
  return

# Call the script function related to the current action of the current controller
@runSpecificActionScript = ->
  $body = $ 'body'
  if $body.data 'controller'
    # hold the current controller coming from the body tag
    controller = $body.data('controller').replace /\//g, '_'
    # hold the current action coming from the body tag
    action = $body.data 'action'
    # set the current active controller script, based on the current controller set previously
    @ActiveController = getController controller

    if @ActiveController != undefined
      # call the init function (if any)
      if $.isFunction @ActiveController.init
        @ActiveController.init()
      # call the function related to the current action (if any)
      if $.isFunction @ActiveController[action]
        @ActiveController[action]()
  return

# Store a given controller object by its name in the @Controllers
@setController = (controllerName, controllerObj) ->
  @Controllers[controllerName] = controllerObj
  return

# Get a given controller object by its name from the @Controllers
@getController = (controllerName) ->
  @Controllers[controllerName]

# Get the current active controller object
@getCurrentController = ->
  @ActiveController
