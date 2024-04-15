const WishList = require("../models/wishlist.model");

const getWishListByToken = async (req, res) => {
  const id = req.user.id;
  const wishList = await WishList.getByUserId(id);
  if (wishList.length === 0) {
    return res.status(404).json({ msg: "There isn't any wishList match!" });
  } else {
    return res.status(200).json({ wishList });
  }
};

const addWishList = async (req, res) => {
  const { bookId } = req.body;
  const id = req.user.id;
  try {
    await WishList.addByUser({ user_id: id, book_id: bookId });
    return res.status(200).json({ msg: "Add wishList successfully!" });
  } catch (error) {
    return res.status(400).json({ msg: "Add wishList failed!" });
  }
};

const removeWishList = async (req, res) => {
  const { bookId } = req.body;
  const id = req.user.id;
  try {
    await WishList.removeByUser({ user_id: id, book_id: bookId });
    return res.status(200).json({ msg: "Remove wishList successfully!" });
  } catch (error) {
    return res.status(400).json({ msg: "Remove wishList failed!" });
  }
};

module.exports = { getWishListByToken, addWishList, removeWishList };
