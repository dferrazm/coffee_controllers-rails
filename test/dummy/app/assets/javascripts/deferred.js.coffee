class DeferredController
  init: ->
    @body = document.querySelectorAll('body')[0]
    @body.insertAdjacentHTML 'afterend', 'deferred page loaded'

  index: ->
    @body.insertAdjacentHTML 'afterend', 'deferred index content'


setTimeout () ->
  setController 'deferred', new DeferredController()
, 5000
# Make sure to change the time here if you override capybara's default wait time (2)
# Time may change depending on how much time each assertion takes
