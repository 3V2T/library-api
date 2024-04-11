const conn = require("../db/index");

const Category = {
  getAll: () => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM vwcategories";
        const [result] = await conn.query(sql);
        resolve(result);
      } catch (error) {
        reject(error);
      }
    });
  },
  getById: (id) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "CALL getCategoriesbyid(?)";
        const [result] = await conn.query(sql, [id]);
        resolve(result[0]);
      } catch (error) {
        reject(error);
      }
    });
  },
  getByCategory: (category) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "SELECT * FROM vwcategories WHERE category =?";
        const [result] = await conn.query(sql, [category]);
        resolve(result);
      } catch (error) {
        reject(error);
      }
    });
  },
};

module.exports = Category;
