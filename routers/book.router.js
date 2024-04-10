const express = require("express");
const { getBookById, getAllBook } = require("../controllers/book.controller");
const authen = require("../middlewares");
const router = express.Router();

router.route("/").get(getAllBook);
router.route("/:id").get(getBookById);

module.exports = router;
