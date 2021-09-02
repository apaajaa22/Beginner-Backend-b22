const { response } = require('../helpers/standardResponse')
const { codeTransaction } = require('../helpers/transaction')
const { getProductsById } = require('../models/products')
const { createTransaction, createProductTransaction, getTransactionByIdOn, getTransactionDetail, getTransactionId, deleteHistory } = require('../models/transactions')
const { getUserById } = require('../models/users')

exports.createTransaction = (req, res) => {
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
  getProductsById(data.product_id.map(id => parseInt(id)), (err, items) => {
    if (!err) {
      console.log('ini pertama', items)
      const code = codeTransaction(process.env.APP_TRANSACTION_PREFIX, 1)
      const total = items.map((item, idx) => item.price * data.product_amount[idx]).reduce((acc, curr) => acc + curr)
      const tax = total * (10 / 100)
      const shippingCost = 10000
      const paymentMethod = data.payment_method
      const idUser = req.authUser.id
      getUserById(idUser, (err, results) => {
        if (!err) {
          console.log('ini kedua', results)
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
            createTransaction(finalData, (err, results) => {
              if (!err) {
                items.forEach((item, idx) => {
                  const dataFinal = {
                    name: item.name,
                    price: item.price,
                    amount: data.product_amount[idx],
                    id_product: item.id,
                    id_transaction: results.insertId,
                    variants: data.product_variant[idx]
                  }
                  createProductTransaction(dataFinal, (err, results) => {
                    if (err) throw err
                  })
                })
                return response(res, 'transaction successfully created', null, 200)
              } else {
                return response(res, 'transaction failed', null, 400)
              }
            })
          }
        } else {
          return response(res, 'id not found!', null, 404)
        }
      })
    } else {
      return response(res, 'id not found!', null, 404)
    }
  })
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

exports.getTransactionDetail = (req, res) => {
  const { id } = req.params
  const { id: user } = req.authUser
  getTransactionByIdOn(user, (err, dataInvoice) => {
    if (err) throw err
    getTransactionDetail(id, (err, results) => {
      if (!err) {
        getTransactionId(id, (err, resultsInvoice) => {
          if (err) throw err
          response(res, 'History Detail', results, 200, undefined, resultsInvoice)
        })
      } else {
        return response(res, 'History not found', null, 404)
      }
    })
  })
}

exports.deleteHistory = (req, res) => {
  const { id } = req.params
  // const { id: user } = req.authUser
  getTransactionId(id, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        deleteHistory(id, (err, results, _fields) => {
          if (!err) {
            return response(
              res,
              'history has been deleted!',
              null,
              200
            )
          } else {
            return response(res, 'history not found!', null, 404)
          }
        })
      } else {
        return response(res, 'history not found!', null, 404)
      }
    }
  })
}
