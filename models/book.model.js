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
  searchByKeyword: (keyword) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM books WHERE title LIKE ?";
        const [results] = await conn.query(sql, [`%${keyword}%`]);
        resolve(results);
      } catch (err) {
        reject(err);
      }
    });
  },
  getBookByKeyWordAuthor: (keyword) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql =
          "SELECT b.id, b.title, b.author_id, b.category_id, b.cover_path, b.file_path, b.description, b.published FROM books b INNER JOIN authors a ON b.author_id = a.id WHERE MATCH(a.author) AGAINST ( ? IN BOOLEAN MODE)";
        const [results] = await conn.query(sql, [`+${keyword}*`]);
        resolve(results);
      } catch (err) {
        reject(err);
      }
    });
  },
  getBookByCategoryId: (category) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM books WHERE category_id = ?";
        const [results] = await conn.query(sql, [category]);
        resolve(results);
      } catch (err) {
        reject(err);
      }
    });
  },
  getByAuthorId: (authorId) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM books WHERE author_id = ?";
        const [results] = await conn.query(sql, [authorId]);
        resolve(results);
      } catch (err) {
        reject(err);
      }
    });
  },
};

module.exports = Book;
