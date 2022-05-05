const queries = require("../db/queries");
const dbConnection = require("../db/connection");
// const storeModel = require("../models/book.model");
const util = require("../util/insertAll");

exports.getProductList = async (req, res) => {
  try {
    let productsListQuery = queries.fridgeQueryList.GET_PRODUCTS_lIST_QUERY;
    let result = await dbConnection.dbQuery(productsListQuery);
     res.end(JSON.stringify(result));
  } catch (err) {
    console.log(`Error: ${err}`);
    return res.status(500).send({ error: `Failed to get products` });
  }
};

exports.saveProducts = async (req, res) => {
  try {
    // req.body
    let topLeft = req.body.topLeft;
    let topRight = req.body.topRight;
    let middleLeft = req.body.middleLeft;
    let middleRight = req.body.middleRight;
    let bottomLeft = req.body.bottomLeft;
    let bottomRight = req.body.bottomRight;

    if (
      !topLeft ||
      !topRight ||
      !middleLeft ||
      !middleRight ||
      !bottomLeft ||
      !bottomRight
    ) {
      return res.status(500).send({
        error: "All wights' data are required, can not be empty",
      });
    }
    // preparing the quantities values which will be inserted into the Database.
    let values = [
      topLeft,
      topRight,
      middleLeft,
      middleRight,
      bottomLeft,
      bottomRight,
    ];
    util.insertAll(...values);
    // insert(...values);
    // let insertResult = insert(...values);
    // console.log(insertResult);
    return res.status(201).send("successfully quantities inserted");
  } catch (err) {
    console.log(err);
    return res.status(500).send({ error: `Failed to insert quantities` });
  }
};
