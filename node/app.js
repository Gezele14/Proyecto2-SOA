const express = require("express");

const app = express();
const bodyParser = require("body-parser");
const methodOverrride = require("method-override");

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(methodOverrride());

const router = express.Router();

router.get('/', function() {
    resizeBy.send("Helo from node");
});

app.use(router);

app.listen(3000, function() {
    console.log("Node server running on http://localhost:3000")
});
