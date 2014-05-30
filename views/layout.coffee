doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    meta name: 'viewport', content: 'width=device-width, initial-scale=1.0'
    meta 'http-equiv': 'X-UA-Compatible', content: 'IE=edge,chrome=1'
    title -> 'BaseApp'
    link rel: 'shortcut icon', href: '/assets/favicon.ico', type: 'image/x-icon'
    link href: "/assets/css/style.css", rel: "stylesheet", type: "text/css"
    script type: 'text/javascript', src: 'https://code.jquery.com/jquery-2.1.1.min.js'
  body ->
    div id: 'header', -> 
    div id: 'main-content', ->
      div class: 'container', -> 
        @body
    div class: 'footer', ->
      footer class: 'container', ->