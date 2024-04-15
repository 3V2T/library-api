const express = require("express");
const {
  register,
  login,
  getUserById,
  changePassword,
  changeInfo,
} = require("../controllers/user.controller");
const { authen } = require("../middlewares");
const router = express.Router();

router.route("/register").post(register);
router.route("/login").post(login);
router.route("/getUser").get(authen, getUserById);
router.route("/changePassword").post(authen, changePassword);
router.route("/changeInfo").post(authen, changeInfo);
module.exports = router;
