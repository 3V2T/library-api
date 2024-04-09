const mysql = require("mysql2/promise");
const dbconfig = require("../dbconfig");
const conn = mysql.createPool(dbconfig);

module.exports = conn;
