// Create Server and Express Application
var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(8080);

// Add our Application Middlewares
app.use(app.router);

// Add DocPad to our Application
var docpadInstanceConfiguration = {
    // Give it our express application and http server
    serverExpress: app,
    serverHttp: server,

    // Tell it not to load the standard middlewares (as we handled that above)
    middlewareStandard: false
};
var docpadInstance = require('docpad').createInstance(docpadInstanceConfiguration, function(err){
    if (err)  return console.log(err.stack);

    // Tell DocPad to perform a generation, extend our server with its routes, and watch for changes
    docpadInstance.action('generate server watch', function(err){
        if (err)  return console.log(err.stack);
    });
});

// Continue with your application
// ...

// Redirect app

var redirect = express();

redirect.all('*', function(req, res){
  console.log(req.subdomains);
  res.redirect('http://nylnook.com:8080/' + req.subdomains[0]);
});

// Vhost app

app.use(vhost('*.nylnook.com', redirect)) // Serves all subdomains via Redirect app
app.use(vhost('nylnook.com', main)); // Serves top level domain via Main server app

app.listen(8080);
console.log('Express app started on port 8080');
