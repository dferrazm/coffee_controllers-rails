# Attach a function to be executed when the DOM is loaded
ready = (fn) ->
  unless document.readyState is "loading"
    fn()
  else
    document.addEventListener "DOMContentLoaded", fn
  return

ready ->
  # Run the specific scripts that have to be run after the DOM is loaded
  runCoffeeController()
  return
