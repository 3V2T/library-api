const express = require("express");
const {
  getAll,
  getById,
  getByName,
} = require("../controllers/author.controller");
const router = express.Router();

router.route("/").get(getAll);
router.route("/search").get(getByName);
router.route("/:id").get(getById);
module.exports = router;
