// making a pool connection and prepare database connection

var mysql = require("mysql");
// ?debug=true
const db_config = "mysql://root:@localhost/dbb";

const pool = mysql.createPool(db_config);

pool.on("acquire", function (connection) {
  console.log(
    "Connection %d acquired (database connected)",
    connection.threadId
  );
  // console.log("database connected");
});

pool.on("connection", function (connection) {
  connection.query("SET SESSION auto_increment_increment=1");
});
pool.on("enqueue", function () {
  console.log("Waiting for available connection slot");
});

pool.on("release", function (connection) {
  console.log(
    "Connection %d released (database disconnected)",
    connection.threadId
  );
  // console.log("database disconnected");
});
module.exports = pool;
