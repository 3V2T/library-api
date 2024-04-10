const express = require("express");
const {
  register,
  login,
  getUserByid,
} = require("../controllers/user.controller");
const authen = require("../middlewares");
const router = express.Router();

router.route("/register").post(register);
router.route("/login").post(login);
router.route("/getUser").get(authen, getUserByid);
module.exports = router;
