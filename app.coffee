# Libs
# ----------
cluster = require 'cluster'
express = require 'express'
partials = require 'express-partials'
stylus = require 'stylus'
jeet = require 'jeet'
nib = require 'nib'
app = express()
# Middleware
# ----------

# Config
# ----------


# App Libs
# ----------


# Express config
# ----------
app.set 'view engine', 'coffee'
app.enable 'trust proxy'
app.engine 'coffee', require('coffeecup').__express
app.configure 'production', () ->
  app.set 'view cache', true
app.use partials()
app.use express.compress()
app.use express.methodOverride()
app.use express.bodyParser()
app.use express.cookieParser()
app.use app.router
app.use stylus.middleware
  src: "#{__dirname}/src/client/"
  dest: "#{__dirname}/public/assets/"
  compile: (str, path) -> stylus(str).set('filename', path).set('compress', true).use(jeet()).use(nib()).import('nib')
app.use express.static "#{__dirname}/public"

# Routing
# ----------

app.get '/', (req, res) -> res.render 'home', layout: false

# App
# ----------
IP = process.env.IP or '127.0.0.1'
PORT = process.env.PORT or 8000
FORKS = process.env.FORKS or 1
if cluster.isMaster
  console.log 'LiberClub process is running'
  cluster.fork() for i in [0...FORKS]
  cluster.on 'death', (worker) ->
    console.log "FORK process #{worker?.pid} just died"
    cluster.fork()
else
  app.listen PORT, IP
  console.log 'FORK process is running'