# Top-level object to execute controller action's specific scripts
@Controllers ?= {}
@ActiveController = null

# Call the script function related to the current action of the current controller
@runCoffeeController = ->
  body = document.querySelectorAll('body')[0]
  currentController = body.getAttribute 'data-controller'

  if currentController
    # hold the current controller coming from the body tag
    controller = currentController.replace /\//g, '_'
    # hold the current action coming from the body tag
    action = body.getAttribute 'data-action'
    # set the current active controller script, based on the current controller set previously
    @ActiveController = getController controller

    if @ActiveController != undefined
      # call the init function (if any)
      @ActiveController.init() if typeof @ActiveController.init is 'function'
      # call the function related to the current action (if any)
      @ActiveController[action]() if typeof @ActiveController[action] is 'function'

  return

# Store a given controller object by its name in the @Controllers
@setController = (controllerName, controllerObj) ->
  @Controllers[controllerName] = controllerObj
  ready ->
    runCoffeeController() if isCurrentController(controllerName) && controllerObj != getCurrentController()
  return

# Get a given controller object by its name from the @Controllers
@getController = (controllerName) ->
  @Controllers[controllerName]

# Get the current active controller object
@getCurrentController = ->
  @ActiveController

# Check if a given controller is the current by name
@isCurrentController = (controllerName) ->
  body = document.querySelectorAll('body')[0]
  return body.getAttribute('data-controller').replace(/\//g, '_') == controllerName