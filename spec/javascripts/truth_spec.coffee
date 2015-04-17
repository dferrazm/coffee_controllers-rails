#= require coffee_controllers/core

actionsExecuted = null

defineController = (name, init = true) ->
  attributes =
    name: name

    index: -> actionsExecuted.push 'index'
  attributes.init = -> actionsExecuted.push 'init' if init

  window["#{name}Controller"] = -> attributes

defineController 'Foo'
defineController 'FooBar'
defineController 'FooBarHome', false

describe "CoffeeController.byName", ->
  it "returns null if no controller is evaluated", ->
    expect(window.getController 'void').toBe null

  it "instantiate the controller constant camelizing the given name 'foo'", ->
    c = window.getController 'foo'
    expect(c.name).toBe 'Foo'

  it "instantiate the controller constant camelizing the given name 'foo_bar'", ->
    c = window.getController 'foo_bar'
    expect(c.name).toBe 'FooBar'

  it "instantiate the controller constant camelizing the given name 'foo_bar/home'", ->
    c = window.getController 'foo/bar_home'
    expect(c.name).toBe 'FooBarHome'

beforeRun = (controller, action) ->
  actionsExecuted = []
  body = document.querySelectorAll('body')[0]
  body.setAttribute 'data-controller', controller
  body.setAttribute 'data-action', action

describe "CoffeeController.run", ->
  it 'executes the init and action function for the active controller', ->
    beforeRun 'foo', 'index'
    window.runCoffeeController()
    expect(actionsExecuted.join ';').toBe 'init;index'

  it 'executes the init function for the active controller', ->
    beforeRun 'foo', 'unhandled_action'
    window.runCoffeeController()
    expect(actionsExecuted.join ';').toBe 'init'

  it 'executes the index function for the active controller', ->
    beforeRun 'foo_bar_home', 'index'
    window.runCoffeeController()
    expect(actionsExecuted.join ';').toBe 'index'

  it 'executes nothing for an unexistent controller', ->
    beforeRun 'void'
    window.runCoffeeController()
    expect(actionsExecuted.join ';').toBe ''
