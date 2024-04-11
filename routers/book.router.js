const express = require("express");
const {
  getBookById,
  getAllBook,
  searchByKeyword,
  getBookByCategory,
} = require("../controllers/book.controller");
const router = express.Router();

router.route("/").get(getAllBook);
router.route("/search").get(searchByKeyword);
router.route("/:id").get(getBookById);
module.exports = router;
