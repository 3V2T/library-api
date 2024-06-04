const express = require("express");
const {
  getBookById,
  getAllBook,
  searchByKeyword,
  getBookByCategory,
  getBookByKeyWordAuthor,
} = require("../controllers/book.controller");
const router = express.Router();

router.route("/").get(getAllBook);
router.route("/search").get(searchByKeyword);
router.route("/author").get(getBookByKeyWordAuthor);
router.route("/:id").get(getBookById);
module.exports = router;
