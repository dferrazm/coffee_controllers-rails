# Attach a function to be executed when the DOM is loaded
ready = (fn) ->
  if document.readyState is "complete"
    fn()
  else
    document.addEventListener "DOMContentLoaded", fn
  return

ready ->
  # Run the specific scripts that have to be run after the DOM is loaded
  runCoffeeController()
  return
