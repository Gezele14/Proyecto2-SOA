const express = require("express");
const path = require("path");
const logger = require("morgan")
const bodyParser = require('body-parser')
var neo4j = require('neo4j-driver').v1

const app = express();

//View Engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

var driver = neo4j.driver('bolt://localhost', neo4j.auth.basic('neo4j', '123456'));
const session = driver.session();

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


app.post('/restaurant/add',function(req,res){
    const name = req.body.name;
    const province = req.body.province;

    session
        .run('CREATE(n:Restaurant {name: {nameParam}}) RETURN n.name', {nameParam: name})
        .then(function(result){
            session
                .run(   'MATCH(a:Restaurant{name: {nameParam}}), (b:Provincia{name: {provinceParam}}) '+
                        'MERGE(a)-[:en]->(b)', {nameParam: name, provinceParam: province})
                .then(function(result){
                    console.log('Restaurante agregado correctamente')
                    session.close();
                })
                .catch(function(err){
                    console.log(err)
                })
        })
        .catch(function(err){
            console.log(err)
        })
})

app.listen(3000);
console.log('Server Started on Port 3000');

module.exports = app;