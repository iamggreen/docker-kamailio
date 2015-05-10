var app = require('express')();
var http = require('http').Server(app);
var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var bodyParser = require('body-parser')

app.use(bodyParser.text());

app.post('/', function(req, res) {
	io.emit('mysql message', req.body);
	res.end();
});
app.get('/', function(req, res){
  res.sendfile('index.html');
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});
