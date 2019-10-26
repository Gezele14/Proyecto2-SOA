const express = require("express");
const path = require("path");
const logger = require("morgan")
const bodyParser = require('body-parser')
const neo4j = require('node-neo4j');

db = new neo4j('http://neo4j:123456@192.168.219.99:7474');

const app = express();

//View Engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));


app.get('/', function(req, res){
    session
        .run('MATCH(n) RETURN n LIMIT 25')
        .then(function(result){
            result.records.forEach(function(record){
                console.log(record._fields[0].properties);
            });
        })
        .catch(function(err){
            console.log(err);
        });
        res.send('it works')
});

app.get('/catalog-service/Restaurants', function(req, res){
    db.cypherQuery("Match (n:Restaurant) RETURN n", function(err, result) {
        if (err) res.send(err);
        res.send(result.data);
    });
});

app.get('/catalog-service/services', function(req, res){
    db.cypherQuery("Match (n:Service) RETURN n", function(err, result) {
        if (err) res.send(err);
        res.send(result.data);
    });
});
app.get('/catalog-service/Food', function(req, res){
    db.cypherQuery("MATCH (n:Food) RETURN n", function(err, result) {
        if (err) res.send(err);
        res.send(result.data);
    });
});
app.get('/catalog-service/Drink', function(req, res){
    db.cypherQuery("MATCH (n:Drink) RETURN n", function(err, result) {
        if (err) res.send(err);
        res.send(result.data);
    });
});
app.listen(4000);
console.log('Server Started on Port 4000');

module.exports = app;