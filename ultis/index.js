const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const Ultis = {
  genAccessToken: (user) => {
    const payload = {
      userId: user.id,
      username: user.username,
    };
    const options = {
      expiresIn: "30m",
    };
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

  hashPassword: async (password) => {
    const saltRounds = 10;
    const salt = await bcrypt.genSalt(saltRounds);
    const hash = await bcrypt.hash(password, salt);
    return hash;
  },
  comparePassword: async (password, hash) => {
    return await bcrypt.compare(password, hash);
  },
};

module.exports = Ultis;
