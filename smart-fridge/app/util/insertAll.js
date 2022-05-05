// this module to insert all quantites into the tables
// (execute many of queries sequentialy into database )

const queries = require("../db/queries");
const dbConnection = require("../db/connection");

exports.insertAll = async (tl, tr, ml, mr, bl, br) => {
  try {
    let inserQueries = queries.fridgeQueryList;
    await dbConnection.dbQuery(inserQueries.SAVE_TL_SHELF_QUERY, [[tl]]);
    await dbConnection.dbQuery(inserQueries.SAVE_TR_SHELF_QUERY, [[tr]]);
    await dbConnection.dbQuery(inserQueries.SAVE_ML_SHELF_QUERY, [[ml]]);
    await dbConnection.dbQuery(inserQueries.SAVE_MR_SHELF_QUERY, [[mr]]);
    await dbConnection.dbQuery(inserQueries.SAVE_BL_SHELF_QUERY, [[bl]]);
    await dbConnection.dbQuery(inserQueries.SAVE_BR_SHELF_QUERY, [[br]]);

    return true;
  } catch (error) {
    console.log(
      "there is an error while executing insert queries in database."
    );
    return error;
  }
};

// async function insert(tl, tr, ml, mr, bl, br) {
//   try {
//     let inserQueries = queries.fridgeQueryList;
//     await dbConnection.dbQuery(inserQueries.SAVE_TL_SHELF_QUERY, [[tl]]);
//     await dbConnection.dbQuery(inserQueries.SAVE_TR_SHELF_QUERY, [[tr]]);
//     await dbConnection.dbQuery(inserQueries.SAVE_ML_SHELF_QUERY, [[ml]]);
//     await dbConnection.dbQuery(inserQueries.SAVE_MR_SHELF_QUERY, [[mr]]);
//     await dbConnection.dbQuery(inserQueries.SAVE_BL_SHELF_QUERY, [[bl]]);
//     await dbConnection.dbQuery(inserQueries.SAVE_BR_SHELF_QUERY, [[br]]);

//     return true;
//   } catch (error) {
//     console.log(
//       "there is an error while executing insert queries in database."
//     );
//     throw error;
//   }
// }
