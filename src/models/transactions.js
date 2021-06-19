const db = require('../helpers/db')
const table = 'transactions'

exports.createTransaction = (data, cb) => {
  db.query(`
  INSERT INTO ${table} (code, total, tax, shipping_cost, shipping_address, payment_method, id_user)
  VALUES (?,?,?,?,?,?,?)
  `, [data.code, data.total, data.tax, data.shipping_cost, data.shipping_address, data.payment_method, data.id_user], cb)
}

exports.createProductTransaction = (data, cb) => {
  db.query(`
  INSERT INTO product_${table} (name, price, amount, id_product, id_transaction) VALUES (?,?,?,?,?)
  `, [data.name, data.price, data.amount, data.id_product, data.id_transaction], cb)
}
exports.getTransactionByIdOn = (id, cb) => {
  db.query(`
  SELECT id, code, total, tax, shipping_cost, shipping_address, payment_method FROM transactions
  WHERE id_user = ?`, [id], cb)
}
exports.getTransactionDetail = (id, cb) => {
  db.query(`
  SELECT name, price, amount FROM product_transactions
WHERE product_transactions.id_transaction = ?`, [id], cb)
}
