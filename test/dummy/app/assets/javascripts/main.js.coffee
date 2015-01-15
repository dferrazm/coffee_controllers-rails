class MainController
  init: ->
    $('body').after 'page loaded'

  home: ->
    $('body').after 'home content'

  dashboard: ->
    $('body').after 'dashboard content'

setController 'main', new MainController()
