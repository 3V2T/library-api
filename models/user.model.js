const conn = require("../db/index");

const User = {
  register: (user) => {
    return new Promise(async (resolve, reject) => {
      const { username, password, name, email } = user;
      try {
        const sql = "CALL themuser(?,?,?,?)";
        const result = await conn.query(sql, [username, password, name, email]);
        resolve(result);
      } catch (error) {
        reject(error);
      }
    });
  },
  login: (user) => {
    return new Promise(async (resolve, reject) => {
      const { username, password } = user;
      try {
        const sql = "CALL getuserbyusername(?,?)";
        const [result] = await conn.query(sql, [username, password]);
        resolve(result[0]);
      } catch (error) {
        reject(error);
      }
    });
  },
  getById: (id) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = "CALL getUsersbyid(?)";
        const [result] = await conn.query(sql, [id]);
        resolve(result[0]);
      } catch (error) {
        reject(error);
      }
    });
  },
};

module.exports = User;
