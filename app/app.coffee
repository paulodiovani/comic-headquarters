express      = require("express")
path         = require("path")
favicon      = require("serve-favicon")
cookieParser = require("cookie-parser")
bodyParser   = require("body-parser")
mongoose     = require("mongoose")
logger       = require("morgan")

app          = express()
http         = require('http').Server(app)
io           = require('socket.io')(http)

#Connect to mongodb
mongoose.connect "mongodb://\
  #{process.env.MONGODB_USER}:#{process.env.MONGODB_PASS}@\
  #{process.env.MONGODB_SERVER}:#{process.env.MONGODB_PORT}/\
  #{process.env.MONGODB_NAME}"

# view engine setup
app.set "views", path.join(__dirname, "templates")
app.set "view engine", "ejs"

# middlewares
app.use favicon(__dirname + '/assets/favicon.ico')
app.use logger("dev")
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: false)
app.use cookieParser()
app.use express.static(path.join(__dirname, "assets"))

###
Application routes goes here
Add for each route/*
###
# app.use "/", require("./routes/index")

# development error handler
# will print stacktrace
if app.get("env") is "development"
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render "error",
      message: err.message
      error: err
    return

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render "error",
    message: err.message
    error: {}
  return

# live reload
if app.get("env") is "development"
  app.use require('connect-livereload')()

module.exports = http
