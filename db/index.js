const mysql = require("mysql2/promise");
const dbconfig = require("../dbconfig");
console.log(dbconfig);
const conn = mysql.createPool({
    host: 'localhost', 
    user: 'root', 
    password: 'van123456', 
    database: 'newlibrary',
});


module.exports = conn;
