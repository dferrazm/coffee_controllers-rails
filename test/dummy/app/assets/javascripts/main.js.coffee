@MainController = class MainController
  init: ->
    @body = document.querySelectorAll('body')[0]
    @body.insertAdjacentHTML 'afterend', 'page loaded'

  home: ->
    @body.insertAdjacentHTML 'afterend', 'home content'

  dashboard: ->
    @body.insertAdjacentHTML 'afterend', 'dashboard content'
