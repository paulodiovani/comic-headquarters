express  = require("express")
router   = express.Router()

router.get '/', (req, res) ->
  res.render 'index', wellcome: 'Hello, world!'

module.exports = router
