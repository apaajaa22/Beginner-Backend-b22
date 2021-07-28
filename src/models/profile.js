const db = require('../helpers/db')
const table = 'users'

exports.createProfile = (data, cb) => {
  db.query(`
  INSERT INTO ${table} (role ,name, email, password, phone_number) VALUES (?,?,?,?,?)
  `, [data.role, data.name, data.email, data.password, data.phone_number], cb)
}
exports.getProfile = (id, cb) => {
  db.query(`
  SELECT id, role, name, email, address, phone_number, picture, gender, birth FROM ${table} WHERE id = ?
  `, [id], cb)
}
exports.updateProfile = (data, id, cb) => {
  db.query(`
  UPDATE ${table} SET name=?, email=?, address=?, phone_number=?, picture=?, gender=?, birth=? WHERE id=?
  `, [data.name, data.email, data.address, data.phone_number, data.picture, data.gender, data.birth, id], cb)
}
exports.updateProfile2 = (data, id, cb) => {
  db.query(`
  UPDATE ${table} SET name=?, email=?, address=?, phone_number=?, gender=?, birth=? WHERE id=?
  `, [data.name, data.email, data.address, data.phone_number, data.gender, data.birth, id], cb)
}
exports.changeProfilePassword = (data, id, cb) => {
  db.query(`
  UPDATE ${table} SET password=? WHERE id=?
  `, [data.password, id], cb)
}
exports.updateProfilePartial = (data, cb) => {
  const key = Object.keys(data)
  const lastColumn = key[key.length - 1]
  db.query(`
  UPDATE ${table} SET ${lastColumn} = ?, updated_at=? WHERE id=?
  `, [data[lastColumn], data.updated_at, data.id], cb)
}
exports.deleteProfile = (id, cb) => {
  db.query(`
  DELETE FROM ${table} WHERE id=?
  `, [id], cb)
}
