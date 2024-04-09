const Book = require("../models/book.model");
const getAllBook = async (req, res) => {
  const books = await Book.getAll();
  if (books.length === 0) {
    return res
      .status(404)
      .json({ statusCode: 404, msg: `not found any books` });
  } else {
    Array.from(books).forEach((book) => {
      book.cover_path = "/uploads/books-cover/" + book.cover_path;
      book.file_path = "/uploads/books/" + book.file_path;
    });
    return res.status(200).json({ books });
  }
};

const getBookById = async (req, res) => {
  const id = req.params.id;
  console.log(id);
  const books = await Book.getById(id);
  if (books.length === 0) {
    return res.status(404).json({ msg: `not found any books have id ${id}` });
  } else {
    Array.from(books).forEach((book) => {
      book.cover_path = "/uploads/books-cover/" + book.cover_path;
      book.file_path = "/uploads/books/" + book.file_path;
    });
    return res.status(200).json({ books });
  }
};

module.exports = { getBookById, getAllBook };
