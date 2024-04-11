const Category = require("../models/category.model");

const getAll = async (req, res) => {
  const name = req.query.name;
  if (name) {
    const category = await Category.getByCategory(name);
    if (category.length === 0) {
      return res.status(404).json({ msg: "There isn't any category match!" });
    } else {
      return res.status(200).json({ category });
    }
  } else {
    const categories = await Category.getAll();
    if (categories.length !== 0) {
      return res.status(200).json({ categories });
    } else {
      return res.status(404).json({ msg: "There is no category" });
    }
  }
};

const getById = async (req, res) => {
  const { id } = req.params;
  const category = await Category.getById(id);
  if (category.length === 0) {
    return res.status(404).json({ msg: "There isn't any category match!" });
  } else {
    return res.status(200).json({ category });
  }
};

const getByCategory = async (req, res) => {};

module.exports = { getAll, getById };
