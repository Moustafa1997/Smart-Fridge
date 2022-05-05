const express = require("express");
const router = express.Router();
const fridgeCtrl = require("../controller/fridge.controller");

router.get("/fridge", fridgeCtrl.getProductList);
router.post("/fridge/save", fridgeCtrl.saveProducts);
// router.put("/fridge/update", fridgeCtrl.updateNode);
// router.delete("/fridge/delete", fridgeCtrl.deleteNote);

module.exports = router;
