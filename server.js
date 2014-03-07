var docpadInstanceConfiguration = {
    env: 'production'
};

require('docpad').createInstance(docpadInstanceConfiguration, function(err,docpadInstance){
    if (err)  return console.log(err.stack);
    var generateOpts = {};
    docpadInstance.action('generate server watch', generateOpts, function(err,result){
        if (err)  return console.log(err.stack);
        // ...
    });
});
