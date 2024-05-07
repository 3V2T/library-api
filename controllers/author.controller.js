const Author = require("../models/author.model");

const getAll = async (req, res) => {
  const name = req.query.name;
  if (name) {
    const authorList = await Author.getBySlug(name);
    if (authorList.length !== 0) {
      return res.status(200).json({ author: authorList });
    } else {
      return res.status(404).json({ msg: "There is no author" });
    }
  } else {
    const authorList = await Author.getAll();
    if (authorList.length !== 0) {
      return res.status(200).json({ author: authorList });
    } else {
      return res.status(404).json({ msg: "There is no author" });
    }
  }
};

const getById = async (req, res) => {
  const { id } = req.params;
  const author = await Author.getById(id);
  if (author.length === 0) {
    return res.status(404).json({ msg: "There isn't any author match!" });
  } else {
    return res.status(200).json({ author });
  }
};

const getByName = async (req, res) => {
  const { name } = req.query;
  const author = await Author.getByName(name);
  if (author.length === 0) {
    return res.status(404).json({ msg: "There isn't any author match!" });
  } else {
    return res.status(200).json({ author });
  }
};

module.exports = { getAll, getById, getByName };
