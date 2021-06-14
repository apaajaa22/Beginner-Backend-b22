const { response } = require('../helpers/standardResponse')
const variantModel = require('../models/variants')
const { APP_URL } = process.env
const pageInfo = {}
exports.createVariants = (req, res) => {
  variantModel.createVariants(req.body, (err, results, _fields) => {
    if (!err) {
      return response(res, 'variant added successfully', null, 200)
    } else {
      return response(res, 'variant failed to add', null, 400, pageInfo)
    }
  })
}

exports.getVariants = (req, res) => {
  const data = req.query
  data.limit = parseInt(data.limit) || 5
  data.offset = parseInt(data.offset) || 0
  data.page = parseInt(data.page) || 1
  data.offset = (data.page * data.limit) - data.limit

  variantModel.getVariants(data, (err, results, _fields) => {
    if (!err) {
      variantModel.getCountVariants((err, resultCount, _fields) => {
        if (!err) {
          const totalData = resultCount[0].count
          const lastPage = Math.ceil(totalData / data.limit)
          pageInfo.totalData = totalData
          pageInfo.currentPage = data.page
          pageInfo.lastPage = lastPage
          pageInfo.limitData = data.limit
          pageInfo.nextPage = data.page < lastPage ? `${APP_URL}/variants?page=${data.page + 1}` : null
          pageInfo.prevPage = data.page > 1 ? `${APP_URL}/variants?page=${data.page - 1}` : null
          return response(res, 'List variants', results, 200, pageInfo)
        }
      })
    } else {
      return response(res, 'List variants not found', null, 404, pageInfo)
    }
  })
}

exports.updateVariantsPartial = (req, res) => {
  const { id } = req.params
  variantModel.getVariantsById(id, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        const key = Object.keys(req.body)
        if (key.length > 1) {
          return response(res, 'System just need one column', null, 400)
        } else {
          const firstColumn = key[0]
          const updateData = { id, [firstColumn]: req.body[firstColumn] }
          variantModel.updateVariantsPartial(updateData, (err, results, _fields) => {
            if (!err) {
              return response(res, 'variants updated successfully', null, 200)
            } else {
              return response(res, 'variants failed to update', null, 400)
            }
          })
        }
      } else {
        return response(res, 'variants not found', null, 404)
      }
    } else {
      return response(res, 'variants not found', null, 404)
    }
  })
}

exports.updateVariants = (req, res) => {
  const { id } = req.params
  variantModel.getVariantsById(id, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        const { name } = req.body
        const updateData = { id, name }
        variantModel.updateVariants(updateData, (err, results, _fields) => {
          if (!err) {
            return response(res, 'variant successfully updated', null, 200)
          } else {
            return response(res, 'An error occurred', null, 400)
          }
        })
      } else {
        return response(res, 'variants not found!', null, 404)
      }
    } else {
      return response(res, 'variant failed to update', null, 404, pageInfo)
    }
  })
}

exports.deleteVariants = (req, res) => {
  const { id } = req.params
  variantModel.getVariantsById(id, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        variantModel.deleteVariants(id, (err, results, _fields) => {
          if (!err) {
            return response(res, 'variants has been deleted!', null, 200)
          } else {
            return response(res, 'variants not found!', null, 404)
          }
        })
      } else {
        return response(res, 'variants not found!', null, 404)
      }
    }
  })
}
