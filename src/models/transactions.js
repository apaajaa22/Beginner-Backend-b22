const db = require('../helpers/db')
const table = 'transactions'
const { promisify } = require('util')
const execPromise = promisify(db.query).bind(db)

exports.createTransaction = (data, cb) => {
  db.query(
    `
  INSERT INTO ${table} (code, total, tax, shipping_cost, shipping_address, payment_method, id_user)
  VALUES (?,?,?,?,?,?,?)
  `,
    [
      data.code,
      data.total,
      data.tax,
      data.shipping_cost,
      data.shipping_address,
      data.payment_method,
      data.id_user
    ],
    cb
  )
}
exports.createTransactionAysnc = (data) => {
  return execPromise(
    `
    INSERT INTO ${table} (code, total, tax, shipping_cost, shipping_address, payment_method, id_user)
  VALUES (?,?,?,?,?,?,?)`,
    [data.code,
      data.total,
      data.tax,
      data.shipping_cost,
      data.shipping_address,
      data.payment_method,
      data.id_user]
  )
}

exports.createProductTransaction = (data, cb) => {
  db.query(
    `
  INSERT INTO product_${table} (name, price, amount, id_product, id_transaction, variants) VALUES (?,?,?,?,?,?)
  `,
    [
      data.name,
      data.price,
      data.amount,
      data.id_product,
      data.id_transaction,
      data.variants
    ],
    cb
  )
}
exports.createProductTransactionAsync = (data) => {
  return execPromise(
    `
    INSERT INTO product_${table} (name, price, amount, id_product, id_transaction, variants) VALUES (?,?,?,?,?,?)`,
    [data.name,
      data.price,
      data.amount,
      data.id_product,
      data.id_transaction,
      data.variants]
  )
}
exports.getTransactionByIdOn = (id) => {
  return execPromise(
    `
    SELECT id, code, total, tax, shipping_cost, shipping_address, payment_method FROM transactions
  WHERE id_user = ?`,
    [id]
  )
}
exports.getTransactionDetail = (id) => {
  return execPromise(
    `
    SELECT product_transactions.name, product_transactions.price, product_transactions.amount, product_transactions.id_product, product_transactions.id_transaction, variants.name AS variants
FROM product_transactions
LEFT JOIN variants on variants.id = product_transactions.variants
WHERE product_transactions.id_transaction = ?`,
    [id]
  )
}
exports.getTransactionId = (id) => {
  return execPromise(
    `
    SELECT id, code, total, tax, shipping_cost, shipping_address, payment_method FROM transactions
  WHERE id = ?`,
    [id]
  )
}

exports.deleteHistory = (id) => {
  return execPromise(
    `
    DELETE FROM transactions WHERE id=?`,
    [id]
  )
}
