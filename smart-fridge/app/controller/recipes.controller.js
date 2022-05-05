const queries = require("../db/queries");
const dbConnection = require("../db/connection");
 
exports.getmeals = async (req, res) => {
  try {
    let x = queries.fridgeQueryList.meals;
    let result = await dbConnection.dbQuery(x);
     res.end(JSON.stringify(result));
  } catch (err) {
    console.log(`Error: ${err}`);
    return res.status(500).send({ error: `Failed to get meals` });
  }
};

exports.suggetmeals = async (req, res) => {
  try {
    let x = queries.fridgeQueryList.suggestmeals;
    let result = await dbConnection.dbQuery(x);
     res.end(JSON.stringify(result));
  } catch (err) {
    console.log(`Error: ${err}`);
    return res.status(500).send({ error: `Failed to get meals` });
  }
};