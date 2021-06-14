const db = require('../helpers/db')
const table = 'users'

exports.createUsers = (data, cb) => {
  db.query(`
  INSERT INTO ${table} (name, email, password) VALUES (?,?,?)
  `, [data.name, data.email, data.password], cb)
}

exports.getUserByEmail = (email, cb) => {
  db.query(`
  SELECT users.id ,users.email, users.password FROM users WHERE users.email = ?
  `, [email], cb)
}
exports.getUserRole = (id, cb) => {
  db.query(`
  SELECT role FROM users WHERE id = ?
  `, [id], cb)
}
