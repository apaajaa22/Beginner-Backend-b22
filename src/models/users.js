const db = require('../helpers/db')
const table = 'users'
const { promisify } = require('util')
const execPromise = promisify(db.query).bind(db)

exports.createUsers = (data, cb) => {
  db.query(
    `
  INSERT INTO ${table} (name, phone_number, email, password) VALUES (?,?,?)
  `,
    [data.name, data.phone_number, data.email, data.password],
    cb
  )
}

exports.getUserByEmail = (email, cb) => {
  db.query(
    `
  SELECT users.id ,users.email, users.password FROM users WHERE users.email = ?
  `,
    [email],
    cb
  )
}
exports.getUserRole = (id, cb) => {
  db.query(
    `
  SELECT role FROM users WHERE id = ?
  `,
    [id],
    cb
  )
}

exports.getUserRoleAsync = (id) => {
  return execPromise(
    `
  SELECT role FROM users WHERE id = ?
  `,
    [id]
  )
}
exports.getUserIdAsync = (id) => {
  return execPromise(
    `
  SELECT id FROM users WHERE id = ?
  `,
    [id]
  )
}
exports.getUserById = (id, cb) => {
  db.query(
    `
  SELECT id, role, name, picture, email, address, phone_number FROM users WHERE id = ?
  `,
    [id],
    cb
  )
}
