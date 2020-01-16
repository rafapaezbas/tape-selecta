const express = require("express");
const app = express();
const fs = require('fs');

//Add cors headers
app.use(function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	next();
});

app.get('/status',(req, res) => {
	var jsonStatus = fs.readFileSync('/home/info.json','utf8');
	res.send(jsonStatus);
});

app.listen(3000, () => {
	console.log("El servidor está inicializado en el puerto 3000");
});
