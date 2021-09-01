const db = require('../helpers/db')
const { promisify } = require('util')
const execPromise = promisify(db.query).bind(db)
const table = 'variants'

exports.createVariants = (data) => {
  return execPromise(
    `
    INSERT INTO ${table} (name, code) VALUES (?,?)
  `, [data.name, data.code]
  )
}
// exports.getVariants = (data, cb) => {
//   db.query(`
//   SELECT id, name, code, created_at, updated_at FROM ${table} LIMIT ? OFFSET ?
//   `, [data.limit, data.offset], cb)
// }
exports.getVariants = () => {
  return execPromise(
    `
    SELECT id, name, code, created_at, updated_at FROM ${table}
  `
  )
}

exports.getVariantsById = (id) => {
  return execPromise(
    `
    SELECT variants.id, variants.name, variants.created_at, variants.updated_at
  FROM ${table} WHERE variants.id=?
  `, [id]
  )
}
exports.updateVariants = (data, cb) => {
  return execPromise(
    `
    UPDATE ${table} SET name=? WHERE id=?
  `, [data.name, data.id]
  )
}

exports.updateVariantsPartial = (data) => {
  const key = Object.keys(data)
  const lastColumn = key[key.length - 1]
  return execPromise(
    `
    UPDATE ${table} SET ${lastColumn} = ?, updated_at=? WHERE id=?
  `, [data[lastColumn], data.updated_at, data.id]
  )
}

exports.deleteVariants = (id) => {
  return execPromise(
    `
    DELETE FROM ${table} WHERE variants.id=?
  `, [id]
  )
}
exports.getCountVariants = (cb) => {
  db.query(`
  SELECT COUNT(variants.id) AS count FROM variants WHERE variants.name LIKE '%%'
  `, cb)
}
