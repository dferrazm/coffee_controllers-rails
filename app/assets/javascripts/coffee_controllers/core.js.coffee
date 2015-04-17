# Top-level object to execute controller action's specific scripts
@Controllers ?= {}
@ActiveController = null

# Call the script function related to the current action of the current controller
@runCoffeeController = ->
  body = document.querySelectorAll('body')[0]
  currentController = body.getAttribute 'data-controller'

  if currentController
    # hold the current action coming from the body tag
    action = body.getAttribute 'data-action'
    # set the current active controller script, based on the current controller set previously
    @ActiveController = getController currentController

    if @ActiveController?
      # call the init function (if any)
      @ActiveController.init() if typeof @ActiveController.init is 'function'
      # call the function related to the current action (if any)
      @ActiveController[action]() if typeof @ActiveController[action] is 'function'

  return

# Eval and instantiate a given controller object by its name
@getController = (controller) ->
  # replace / with _
  controllerName = controller.replace /\//g, '_'
  # camelize controller name
  words = controllerName.split /_|\s+/
  array = []
  for word in words
    array.push word.charAt(0).toUpperCase() + word.toLowerCase().slice(1)
  controllerCamelized = array.join ''
  # try to eval the controller and instantiate
  try
    controller = eval "#{controllerCamelized}Controller"
    return new controller()
  catch
    return null

# Get the current active controller object
@getCurrentController = ->
  @ActiveController
