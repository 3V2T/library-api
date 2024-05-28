const conn = require('../db/index')
const { format } = require('date-fns');

const History = { 
getAllEventsById: (id) => {
  return new Promise(async (resolve, reject) => {
    try {
      const sql = 'CALL gethistorybyuserid(?)';
      const [results] = await conn.query(sql, [id]);

      // Giả sử results là một mảng các đối tượng và bạn cần định dạng lại thời gian trong từng đối tượng
      const formattedResults = results[0].map(event => {
        return {
          ...event,
          // Giả sử trường thời gian có tên là event_time
          last_read: format(new Date(event.last_read), 'yyyy-MM-dd HH:mm:ss')
        }
      })

      resolve(formattedResults);
    } catch (err) {
      reject(err)
    }
  })
},
  addEventByUser: (data) => {
    return new Promise(async (resolve, reject) => {
      try {
        const sql = 'INSERT INTO history (user_id, book_id, last_read) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE last_read = VALUES(last_read)'
        const [results] = await conn.query(sql, [data.user_id, data.book_id, data.last_read])
        resolve(results)
      } catch (err) {
        reject(err)
      }
    })
  },
}

module.exports = History
