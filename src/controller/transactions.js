/* eslint-disable no-unused-vars */
const { response } = require('../helpers/standardResponse')
const { codeTransaction } = require('../helpers/transaction')
const { getProductsById, getProductsByIdAync } = require('../models/products')
const { createProductTransactionAsync, createTransaction, createProductTransaction, getTransactionByIdOn, getTransactionDetail, getTransactionId, deleteHistory, createTransactionAysnc } = require('../models/transactions')
const { getUserById, getUserByIdAsync } = require('../models/users')

exports.createTransaction = async (req, res) => {
  const data = req.body
  if (typeof data.product_id === 'string') {
    data.product_id = [data.product_id]
  }
  if (typeof data.product_amount === 'string') {
    data.product_amount = [data.product_amount]
  }
  if (typeof data.product_variant === 'string') {
    data.product_variant = [data.product_variant]
  }
  const items = await getProductsByIdAync(data.product_id.map(id => parseInt(id)))
  if (items.length > 0) {
    const code = codeTransaction(process.env.APP_TRANSACTION_PREFIX, 1)
    const total = items.map((item, idx) => item.price * data.product_amount[idx]).reduce((acc, curr) => acc + curr)
    const tax = total * (10 / 100)
    const shippingCost = 10000
    const paymentMethod = data.payment_method
    const idUser = req.authUser.id
    const results = await getUserByIdAsync(idUser)
    if (results.length > 0) {
      const shippingAddress = results[0].address
      const finalData = {
        code,
        total,
        tax,
        shipping_cost: shippingCost,
        shipping_address: shippingAddress,
        payment_method: paymentMethod,
        id_user: idUser
      }
      if (!shippingAddress) {
        return response(res, 'address must be filled', null, 400)
      } else {
        const successCreateTrx = await createTransactionAysnc(finalData)
        if (successCreateTrx.affectedRows > 0) {
          items.forEach((item, idx) => {
            const dataFinal = {
              name: item.name,
              price: item.price,
              amount: data.product_amount[idx],
              id_product: item.id,
              id_transaction: successCreateTrx.insertId,
              variants: data.product_variant[idx]
            }
            createProductTransaction(dataFinal)
          })
          return response(res, 'transaction successfully created', null, 200)
        }
      }
    } else {
      return response(res, 'user not found!', null, 404)
    }
  } else {
    return response(res, 'id product not found!', null, 404)
  }
}

exports.getTransactionByIdOn = async (req, res) => {
  const { id } = req.authUser
  const results = await getTransactionByIdOn(id)
  if (results.length > 0) {
    return response(res, 'History Transaction', results, 200)
  } else {
    return response(res, 'History not found', null, 404)
  }
}

exports.getTransactionDetail = async (req, res) => {
  const { id } = req.params
  const { id: user } = req.authUser
  await getTransactionByIdOn(user)
  const results = await getTransactionDetail(id)
  if (results.length > 0) {
    const invoice = await getTransactionId(id)
    return response(res, 'History Detail', results, 200, null, invoice)
  } else {
    return response(res, 'History not found', null, 404)
  }
}

exports.deleteHistory = async (req, res) => {
  const { id } = req.params
  const results = await getTransactionId(id)
  if (results.length > 0) {
    await deleteHistory(id)
    return response(res, 'history has been deleted!', null, 200)
  } else {
    return response(res, 'history not found!', null, 404)
  }
}
