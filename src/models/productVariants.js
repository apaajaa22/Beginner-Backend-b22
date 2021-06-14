const db = require('../helpers/db')

const table = 'product_variants'

exports.createProductVariants = (data, cb) => {
  const query = db.query(`
  INSERT INTO ${table} (additional_price, id_product, id_variant)
  VALUES (?,?,?)
  `, [data.additional_price, data.id_product, data.id_variant], cb)
  console.log('PV', query.sql)
}
