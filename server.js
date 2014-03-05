var http = require("http");

http.createServer(function(req, res) {
    res.writeHead(200, {"Content-Type": "text/html; charset=utf-8"});
    res.end('<!DOCTYPE html><html><meta charset="utf-8"><title>It works' +
            "</title><b>It works!</b><br /><br />This is the server's " +
            "default server.js.");
}).listen(8080);
console.log("Server ready to accept requests on port 8080");
