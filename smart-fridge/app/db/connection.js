let pool = require("./pool");

// promise > take the( query text) and (params) if it there and execute it into database.

exports.dbQuery = (queryText, queryParams) => {
  return new Promise((resolve, reject) => {
    pool.query(queryText, queryParams, (err, result) => {
      if (err) {
        reject(err);
      }
      resolve(result);
    });
  });
};
