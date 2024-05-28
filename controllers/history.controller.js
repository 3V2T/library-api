
const History = require('../models/history.model')

const getHistoryByToken = async (req, res) => {
  const id = req.user.id
  const history = await History.getAllEventsById(id)
  if (history.length === 0) {
    return res.status(404).json({ msg: "your history is empty" })
  } else {
    return res.status(200).json({ history })
  }
}

const addEvent = async (req, res) => {
  const { bookId, lastRead } = req.body
  const id = req.user.id
  try {
    await History.addEventByUser({ user_id: id, book_id: bookId, last_read: lastRead })
    return res.status(200).json({ msg: 'Add event successfully!' })
  } catch (error) {
    return res.status(400).json({ msg: 'Add event failed!' })
  }
}

module.exports = { getHistoryByToken, addEvent }