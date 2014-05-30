App =
  init: () ->
    @set_handlers()

  set_handlers: () ->
  	console.log('Buenos días')

$ ->
  App.init()