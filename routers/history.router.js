const express = require('express')
const {
  getHistoryByToken,
  addEvent,
} = require('../controllers/history.controller')
const router = express.Router()
const { authen } = require('../middlewares/index')
router.route('/').get(authen, getHistoryByToken).post(authen, addEvent)

module.exports = router
