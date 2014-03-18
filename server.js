var spawn = require('child_process').spawn

var args = ['server'];
spawn('node_modules/.bin/docpad', args, {stdio:'inherit'}).on('close', function(err) {

    if (err)
        console.log("docpad failed");
    else
        console.log("docpad running");

});
