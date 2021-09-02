const db = require('../helpers/db')
const { promisify } = require('util')
const execPromise = promisify(db.query).bind(db)

exports.createProduct = (data, cb) => {
  if (typeof data.price === 'object') {
    data.price = data.price[0]
  }
  db.query(
    `
  INSERT INTO products (picture, name, price, description, quantity, delivery_on)
  VALUES (?,?,?,?,?,?)
  `,
    [
      data.picture,
      data.name,
      data.price,
      data.description,
      data.quantity,
      data.delivery_on
    ],
    cb
  )
}
exports.getProducts = (data, cb) => {
  db.query(
    `
  SELECT products.id, products.name, products.picture,  categories.name AS category_name, products.price, products.description, products.quantity, products.delivery_on FROM products
  LEFT JOIN categories ON products.id_category = categories.id
  LIMIT ? OFFSET ?
  `,
    [data.limit, data.offset],
    cb
  )
}

exports.getProductById = (id, cb) => {
  db.query(
    `
  SELECT products.id, products.name, products.picture, products.description, products.price, products.quantity, categories.name AS category_name ,products.created_at, products.updated_at
  FROM products LEFT JOIN categories ON products.id_category = categories.id
  WHERE products.id = ?
  `,
    [id],
    cb
  )
}

exports.updateProductPartial = (data, cb) => {
  const key = Object.keys(data)
  const lastColumn = key[key.length - 1]
  db.query(`
  UPDATE products SET ${lastColumn} = ? WHERE id=?
  `, [data[lastColumn], data.id], cb)
}

exports.deleteProduct = (id, cb) => {
  db.query(
    `
  DELETE FROM products WHERE id=?
  `,
    [id],
    cb
  )
}

exports.getProductsByCategory = (id, data, cb) => {
  db.query(
    `
  SELECT products.id, products.name, products.picture, products.price,  products.quantity, products.description, products.delivery_on FROM products
  LEFT JOIN product_categories on product_categories.id_product = products.id
  WHERE product_categories.id_category = ? LIMIT ? OFFSET ?
  `,
    [id, data.limit, data.offset],
    cb
  )
}
exports.getProductDetails = (id, cb) => {
  db.query(
    `
  SELECT
products.id,
products.picture,
products.name,
products.description,
products.quantity,
products.delivery_on,
products.price as base_price,
product_variants.additional_price,
product_variants.id_variant as id_variant,
(products.price+product_variants.additional_price) AS end_price ,
variants.name AS variant,
variants.code AS variant_code,
products.created_at,
products.updated_at
FROM products
INNER JOIN product_variants ON product_variants.id_product = products.id
INNER JOIN variants ON product_variants.id_variant = variants.id WHERE products.id = ?
  `,
    [id],
    cb
  )
}
exports.searchProducts = (search, data, cb) => {
  db.query(
    `
  SELECT products.id, products.name, products.picture, products.price, categories.name AS category_name,products.created_at, products.updated_at FROM products
LEFT JOIN categories ON categories.id = products.id_category WHERE products.name LIKE '%${search}%'
LIMIT ? OFFSET ?
  `,
    [data.limit, data.offset],
    cb
  )
}
exports.sortProducts = (search, column, data, order, cb) => {
  db.query(
    `SELECT products.id, products.name, products.picture, products.price, categories.name AS category_name,products.created_at, products.updated_at FROM products
LEFT JOIN categories ON categories.id = products.id_category WHERE products.name LIKE '%${search}%'
ORDER BY products.${column} ${order} LIMIT ? OFFSET ?`,
    [data.limit, data.offset],
    cb
  )
}

exports.sortAllProducts = (column, data, order, cb) => {
  db.query(
    `SELECT products.id, products.name, products.picture, products.price, categories.name AS category_name,products.created_at, products.updated_at FROM products
LEFT JOIN categories ON categories.id = products.id_category
ORDER BY products.${column} ${order} LIMIT ? OFFSET ?`,
    [data.limit, data.offset],
    cb
  )
}

exports.updateProduct = (data, cb) => {
  db.query(
    `
  UPDATE products SET products.picture=?, products.name=? ,products.price=?, products.quantity=?, products.updated_at=? WHERE products.id=?
  `,
    [data.picture, data.name, data.price, data.quantity, data.updated_at, data.id],
    cb
  )
}

exports.updateProductPartial = (data, cb) => {
  const key = Object.keys(data)
  const lastColumn = key[key.length - 1]
  db.query(
    `
  UPDATE products SET ${lastColumn} = ?, updated_at=? WHERE id=?
  `,
    [data[lastColumn], data.updated_at, data.id],
    cb
  )
}
exports.getProductsCount = (data, cb) => {
  db.query(
    `
  SELECT COUNT(products.id) AS count FROM products WHERE products.name LIKE '%${data.search}%'
  `,
    cb
  )
}
exports.getCount = (cb) => {
  db.query(
    `
  SELECT COUNT(products.id) AS count FROM products WHERE products.name LIKE '%%'
  `,
    cb
  )
}
exports.getProductsById = (id, cb) => {
  db.query(
    `
  SELECT id, name, price FROM products WHERE id IN (?)
  `,
    [id],
    cb
  )
}
exports.getProductsByIdAync = (id) => {
  return execPromise(
    `
    SELECT id, name, price FROM products WHERE id IN (?)`,
    [id]
  )
}
