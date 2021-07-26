const db = require('../helpers/db')
const table = 'transactions'

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
exports.getTransactionByIdOn = (id, cb) => {
  db.query(
    `
  SELECT id, code, total, tax, shipping_cost, shipping_address, payment_method FROM transactions
  WHERE id_user = ?`,
    [id],
    cb
  )
}
exports.getTransactionDetail = (id, cb) => {
  db.query(
    `
    SELECT product_transactions.name, product_transactions.price, product_transactions.amount, product_transactions.id_product, product_transactions.id_transaction, variants.name AS variants
FROM product_transactions
LEFT JOIN variants on variants.id = product_transactions.variants
WHERE product_transactions.id_transaction = ?`,
    [id],
    cb
  )
}
exports.getTransactionId = (id, cb) => {
  db.query(
    `
  SELECT id, code, total, tax, shipping_cost, shipping_address, payment_method FROM transactions
  WHERE id = ?`,
    [id],
    cb
  )
}

exports.deleteHistory = (id, cb) => {
  db.query(
    `
  DELETE FROM transactions WHERE id=?
  `,
    [id],
    cb
  )
}
