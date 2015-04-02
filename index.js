(function(){
  'use strict';

  require('coffee-script/register');
  require('dotenv').load();

  var debug = require('debug')('comic-headquarters');
  var app   = require('./app/app');

  /*
  Start the Express App
   */
  var http_server = app.listen(process.env.HTTP_PORT || 3000, function() {
    debug('Express server listening on port ' + http_server.address().port);
  });
})();
