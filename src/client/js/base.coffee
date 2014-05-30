App =
  init: () ->
    @set_handlers()

  set_handlers: () ->
  	console.log('hola')

$ ->
  App.init()