const db = require('../helpers/db')

const table = 'variants'

exports.createVariants = (data, cb) => {
  db.query(`
  INSERT INTO ${table} (name, code)
  VALUES (?,?)
  `, [data.name, data.code], cb)
}
exports.getVariants = (data, cb) => {
  db.query(`
  SELECT id, name, code, created_at, updated_at FROM ${table} LIMIT ? OFFSET ?
  `, [data.limit, data.offset], cb)
}

exports.getVariantsById = (id, cb) => {
  db.query(`
  SELECT variants.id, variants.name, variants.created_at, variants.updated_at
  FROM ${table} WHERE variants.id=?
  `, [id], cb)
}
exports.updateVariants = (data, cb) => {
  db.query(`
  UPDATE ${table} SET name=? WHERE id=?
  `, [data.name, data.id], cb)
}

exports.updateVariantsPartial = (data, cb) => {
  const key = Object.keys(data)
  const lastColumn = key[key.length - 1]
  db.query(`
  UPDATE ${table} SET ${lastColumn} = ?, updated_at=? WHERE id=?
  `, [data[lastColumn], data.updated_at, data.id], cb)
}

exports.deleteVariants = (id, cb) => {
  db.query(`
  DELETE FROM ${table} WHERE variants.id=?
  `, [id], cb)
}
exports.getCountVariants = (cb) => {
  db.query(`
  SELECT COUNT(variants.id) AS count FROM variants WHERE variants.name LIKE '%%'
  `, cb)
}
