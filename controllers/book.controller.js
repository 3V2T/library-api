const Author = require("../models/author.model");
const Book = require("../models/book.model");
const Category = require("../models/category.model");
const getAllBook = async (req, res) => {
  const category = req.query.category;
  const author = req.query.author;
  //query parameter category
  if (category) {
    const categoryList = await Category.getByCategory(category);
    if (categoryList.length !== 0) {
      console.log(categoryList[0].id);
      const books = await Book.getBookByCategoryId(categoryList[0].id);
      if (books.length !== 0) {
        Array.from(books).forEach((book) => {
          book.cover_path = "/uploads/books-cover/" + book.cover_path;
          book.file_path = "/uploads/books/" + book.file_path;
        });
        return res.status(200).json({ books });
      } else {
        return res
          .status(404)
          .json({ msg: "There're any books match this category!" });
      }
    } else {
      return res.status(404).json({ msg: "There isn't any category match!" });
    }
    //query parameter author
  } else if (author) {
    const bookAuthor = await Author.getBySlug(author);
    console.log(bookAuthor);
    if (bookAuthor.length !== 0) {
      const books = await Book.getByAuthorId(bookAuthor[0].id);
      if (books.length !== 0) {
        Array.from(books).forEach((book) => {
          book.cover_path = "/uploads/books-cover/" + book.cover_path;
          book.file_path = "/uploads/books/" + book.file_path;
        });
        return res.status(200).json({ books });
      } else {
        return res
          .status(404)
          .json({ msg: "There're any books match this author!" });
      }
    } else {
    }
  }
  //doesn't have any parameters
  else if (!author && !category) {
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
const searchByKeyword = async (req, res) => {
  const keyword = req.query.keyword;
  const books = await Book.searchByKeyword(keyword);
  if (books.length !== 0) {
    Array.from(books).forEach((book) => {
      book.cover_path = "/uploads/books-cover/" + book.cover_path;
      book.file_path = "/uploads/books/" + book.file_path;
    });
    return res.status(200).json({ books });
  } else {
    return res
      .status(404)
      .json({ msg: "There're any books match this keyword!" });
  }
};
const getBookByCategory = async (req, res) => {
  const param = req.params.category;
  const category = await Category.getByCategory(param);
  if (category.length !== 0) {
    console.log(category[0].id);
    const books = await Book.getBookByCategoryId(category[0].id);
    if (books.length !== 0) {
      Array.from(books).forEach((book) => {
        book.cover_path = "/uploads/books-cover/" + book.cover_path;
        book.file_path = "/uploads/books/" + book.file_path;
      });
      return res.status(200).json({ books });
    } else {
      return res
        .status(404)
        .json({ msg: "There're any books match this category!" });
    }
  } else {
    return res.status(404).json({ msg: "There isn't any category match!" });
  }
};
const getBookByAuthor = async (req, res) => {
  const param = req.params.author;

  const books = await Book.getBookByAuthorId(author);
  if (books.length !== 0) {
    Array.from(books).forEach((book) => {
      book.cover_path = "/uploads/books-cover/" + book.cover_path;
      book.file_path = "/uploads/books/" + book.file_path;
    });
    return res.status(200).json({ books });
  } else {
    return res
      .status(404)
      .json({ msg: "There're any books match this author!" });
  }
};

module.exports = {
  getBookById,
  getAllBook,
  searchByKeyword,
  getBookByCategory,
  getBookByAuthor,
};
