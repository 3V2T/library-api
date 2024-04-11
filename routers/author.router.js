const express = require("express");
const { getAll, getById } = require("../controllers/author.controller");
const router = express.Router();

router.route("/").get(getAll);
router.route("/:id").get(getById);
module.exports = router;
