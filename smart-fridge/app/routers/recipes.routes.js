const express = require("express");
const router = express.Router();
const c = require("../controller/recipes.controller");

router.get("/getmeals", c.getmeals);
router.get("/suggestmeals", c.suggetmeals); 
module.exports = router;