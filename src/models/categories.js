const db = require('../helpers/db')

const table = 'categories'
exports.createCategory = (data, cb) => {
  db.query(`
  INSERT INTO ${table} (name)
  VALUES (?)
  `, [data.name], cb)
}
exports.getCategory = (data, cb) => {
  db.query(`
  SELECT id, name, created_at, updated_at FROM ${table}
  LIMIT ? OFFSET ?
  `, [data.limit, data.offset], cb)
}
exports.getCategoryById = (id, cb) => {
  db.query(`
  SELECT categories.id, categories.name, categories.created_at, categories.updated_at
  FROM categories WHERE categories.id=?
  `, [id], cb)
}
exports.updateCategory = (data, cb) => {
  db.query(`
  UPDATE ${table} SET name=? WHERE id=?
  `, [data.name, data.id], cb)
}

exports.updateCategoryPartial = (data, cb) => {
  const key = Object.keys(data)
  const lastColumn = key[key.length - 1]
  db.query(`
  UPDATE ${table} SET ${lastColumn} = ?, updated_at=? WHERE id=?
  `, [data[lastColumn], data.updated_at, data.id], cb)
}

exports.deleteCategory = (id, cb) => {
  db.query(`
  DELETE FROM ${table} WHERE categories.id=?
  `, [id], cb)
}
exports.getCountCategory = (cb) => {
  db.query(`
  SELECT COUNT(categories.id) AS count FROM categories WHERE categories.name LIKE '%%'
  `, cb)
}
exports.getCountProductByCategory = (id, cb) => {
  db.query(`
  SELECT COUNT(products.id) AS count  FROM products
  LEFT JOIN product_categories on product_categories.id_product = products.id
  WHERE product_categories.id_category = ${id}
  `, cb)
}
