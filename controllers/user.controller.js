const User = require("../models/user.model");
const { hashPassword, genAccessToken, genRefreshToken } = require("../ultis");

const register = async (req, res) => {
  const user = req.body;
  const result = await User.register(user);
  if (result) {
    return res.status(201).json({ msg: "Create successfully!" });
  } else {
    return res.status(500).json({ msg: "Server got error!" });
  }
};

const login = async (req, res) => {
  const user = req.body;
  const result = await User.login(user);
  if (result) {
    const payload = {
      id: result[0].id,
      username: result[0].username,
    };
    const accessToken = genAccessToken(payload);
    return res.status(200).json({
      user: {
        ...payload,
        accessToken,
      },
    });
  } else {
    return res.status(404).json({ msg: "Username or password is wrong!" });
  }
};

const getUserByid = async (req, res) => {
  const { id } = req.user;
  const user = await User.getById(id);
  if (user.length === 0) {
    return res.status(404).json({ msg: "There isn't any user match!" });
  } else {
    return res.status(200).json({ user });
  }
};

module.exports = { register, login, getUserByid };
