const conn = require("../db/index");
const Book = {
  getAll: () => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM books";
        const [results] = await conn.query(sql);
        resolve(results);
      } catch (err) {
        reject(err);
      }
    });
  },
  getById: (id) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "CALL getBooksbyid(?)";
        const [results] = await conn.query(sql, [id]);
        resolve(results[0]);
      } catch (err) {
        reject(err);
      }
    });
  },
};

module.exports = Book;
