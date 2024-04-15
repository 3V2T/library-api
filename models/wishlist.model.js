const conn = require("../db");

const WishList = {
  getByUserId: (id) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "CALL getwlbyuserid(?)";
        const [result] = await conn.query(sql, [id]);
        resolve(result[0]);
      } catch (error) {
        reject(error);
      }
    });
  },
  addByUser: (data) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "INSERT INTO wishlist (user_id, book_id) VALUES (?, ?)";
        const [result] = await conn.query(sql, [data.user_id, data.book_id]);
        resolve(result[0]);
      } catch (error) {
        reject(error);
      }
    });
  },
  removeByUser: (data) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "DELETE FROM wishlist WHERE user_id =? AND book_id =?";
        const [result] = await conn.query(sql, [data.user_id, data.book_id]);
        resolve(result[0]);
      } catch (error) {
        reject(error);
      }
    });
  },
};

module.exports = WishList;
