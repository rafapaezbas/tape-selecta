const express = require("express");
const app = express();
const path = require('path');
const fs = require('fs');

//Add cors headers
app.use(function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	next();
});

app.use(express.static(path.join(__dirname, 'public')))

app.get('/status',(req, res) => {
	var jsonStatus = fs.readFileSync('/home/info.json','utf8');
	res.send(jsonStatus);
});

app.listen(80, () => {
	console.log("Server started in port 80");
});
