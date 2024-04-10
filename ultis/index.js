const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const Ultis = {
  genAccessToken: (payload) => {
    const options = { expiresIn: "30m" };
    return jwt.sign(payload, process.env.JWT_SECRET, options);
  },

  genRefreshToken: (payload) => {
    const options = { expiresIn: "1w" };
    return jwt.sign(payload, process.env.JWT_SECRET, options);
  },

  verifyAccessToken: (token) => {
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      return decoded;
    } catch (err) {
      throw err;
    }
  },
  verifyRefreshToken: (token) => {
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      return decoded;
    } catch (err) {
      throw err;
    }
  },
};

module.exports = Ultis;
