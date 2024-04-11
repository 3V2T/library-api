const User = require("../models/user.model");
const { genAccessToken } = require("../ultis");

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
  if (result.length !== 0) {
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

const getUserById = async (req, res) => {
  const { id } = req.user;
  const user = await User.getById(id);
  if (user.length === 0) {
    return res.status(404).json({ msg: "There isn't any user match!" });
  } else {
    return res.status(200).json({ user });
  }
};

const changePassword = async (req, res) => {
  const { password, newpassword } = req.body;
  const user = req.user;
  user.password = password;
  const result = await User.login(user);
  if (result.length !== 0) {
    user.password = newpassword;
    try {
      await User.changePassword(user);
      return res.status(200).json({ msg: "Change password successfully!" });
    } catch (err) {
      return res.status(500).json({ msg: "Internal Server Error!" });
    }
  } else {
    return res.status(401).json({ msg: "Pasword is wrong!" });
  }
};

const changeInfo = async (req, res) => {
  const newUser = req.body;
  const user = req.user;
  user.password = newUser.password;
  newUser.id = user.id;
  console.log(user);
  console.log(newUser);
  const result = await User.login(user);
  if (result.length !== 0) {
    console.log("Authentication");
    try {
      await User.changeInfo(newUser);
      return res.status(200).json({ msg: "Change info successfully!" });
    } catch (err) {
      return res.status(500).json({ msg: "Internal Server Error!" });
    }
  } else {
    return res.status(401).json({ msg: "Pasword is wrong!" });
  }
};

module.exports = { register, login, getUserById, changePassword, changeInfo };
