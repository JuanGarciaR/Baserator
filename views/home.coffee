doctype 5
html ->
  head ->
    title "Base App"
    meta "http-equiv": "content-type", content: "text/html; charset=UTF-8"
    meta name: "viewport", content: "width=device-width; initial-scale=0.5; maximum-scale=0.5; user-scalable=0;"
    link href: "assets/css/style.css", rel: "stylesheet", type: "text/css"
    link rel: "shortcut icon", href: "assets/img/favicon.ico"
    script type: "text/javascript", src: "/assets/js/lib/jquery.js"
    script type: "text/javascript", src: "/assets/js/base.js"
  body ->
    p -> 'home'