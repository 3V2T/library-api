const express = require("express");
const {
  getWishListByToken,
  addWishList,
  removeWishList,
} = require("../controllers/wishlist.controller");
const router = express.Router();
const { authen } = require("../middlewares/index");
router
  .route("/")
  .get(authen, getWishListByToken)
  .post(authen, addWishList)
  
router.route("/:id").delete(authen, removeWishList);
module.exports = router;
