const { response } = require('../helpers/standardResponse')
const { codeTransaction } = require('../helpers/transaction')
const { getProductsById } = require('../models/products')
const { createTransaction, createProductTransaction, getTransactionByIdOn, getTransactionDetail } = require('../models/transactions')
const { getUserById } = require('../models/users')

exports.createTransaction = (req, res) => {
  const data = req.body
  if (typeof data.product_id === 'string') {
    data.product_id = [data.product_id]
    data.product_amount = [data.product_amount]
  }
  getProductsById(data.product_id.map(id => parseInt(id)), (err, items) => {
    if (!err) {
      const code = codeTransaction(process.env.APP_TRANSACTION_PREFIX, 1)
      const total = items.map((item, idx) => item.price * data.product_amount[idx]).reduce((acc, curr) => acc + curr)
      const tax = total * (10 / 100)
      const shippingCost = 10000
      const paymentMethod = data.payment_method
      const idUser = req.authUser.id
      getUserById(idUser, (err, results) => {
        if (!err) {
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
            response(res, 'address must be filled', null, 400)
          } else {
            createTransaction(finalData, (err, results) => {
              if (!err) {
                items.forEach((item, idx) => {
                  const dataFinal = {
                    name: item.name,
                    price: item.price,
                    amount: data.product_amount[idx],
                    id_product: item.id,
                    id_transaction: results.insertId
                  }
                  createProductTransaction(dataFinal, (err, results) => {
                    if (!err) {
                      response(res, 'transaction success', null, 200)
                    } else {
                      response(res, 'transaction failed', null, 400)
                    }
                  })
                })
              } else {
                response(res, 'transaction failed', null, 400)
              }
            })
          }
        } else {
          response(res, 'id not found!', null, 404)
        }
      })
    } else {
      response(res, 'id not found!', null, 404)
    }
  })
}

exports.getTransactionByIdOn = (req, res) => {
  const { id } = req.authUser
  getTransactionByIdOn(id, (err, results) => {
    if (results < 1) {
      response(res, 'History not found', null, 404)
    }
    if (!err) {
      response(res, 'History Transaction', results, 200)
    } else {
      response(res, 'History not found', null, 404)
    }
  })
}

exports.getTransactionDetail = (req, res) => {
  const { id } = req.params
  const { id: user } = req.authUser
  getTransactionByIdOn(user, (err, dataInvoice) => {
    if (err) throw err
    getTransactionDetail(id, (err, results) => {
      const invoice = dataInvoice
      if (!err) {
        response(res, 'History Detail', results, 200, undefined, invoice)
      } else {
        response(res, 'History not found', null, 404)
      }
    })
  })
}
