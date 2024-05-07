const conn = require("../db");

const Author = {
  getAll: () => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM authors";
        const [results] = await conn.query(sql);
        resolve(results);
      } catch (err) {
        reject(err);
      }
    });
  },
  getBySlug: (author) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM authors WHERE description = ?";
        const [results] = await conn.query(sql, [author]);
        resolve(results);
      } catch (err) {
        reject(err);
      }
    });
  },
  getById: (id) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "CALL getAuthorsbyid(?)";
        const [results] = await conn.query(sql, [id]);
        resolve(results[0]);
      } catch (err) {
        reject(err);
      }
    });
  },
  getByName: (name) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM authors WHERE author = ?";
        const [results] = await conn.query(sql, [name]);
        resolve(results);
      } catch (err) {
        reject(err);
      }
    });
  },
};

module.exports = Author;
