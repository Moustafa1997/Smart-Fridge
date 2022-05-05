// setup server
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const fridgeRouter = require("./app/routers/fridge.routes");
const routes= require('./app/routers/recipes.routes')
// const recipesRouter = require("./app/routes/recipes.routes");

const app = express();

app.use(cors());
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));
// parse application/json
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("server is started..........");
});

app.use("/api/v1", fridgeRouter);
// app.use("/api/v1", recipesRouter);

app.use("/meals",routes);

app.listen(3000, () => {
  console.log("server started in bort 3000 ...");
});

module.exports = app;
