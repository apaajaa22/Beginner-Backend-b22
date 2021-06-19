const categoryModel = require('../models/categories')
const { response: standardResponse } = require('../helpers/standardResponse')
const { getProductsByCategory } = require('../models/products')
const { getUserRoleAsync } = require('../models/users')
const { APP_URL } = process.env
const pageInfo = {}

exports.createCategory = async (req, res) => {
  const userRole = await getUserRoleAsync(req.authUser.id)
  if (userRole[0].role === 'Admin') {
    categoryModel.createCategory(req.body, (err, results, _fields) => {
      if (!err) {
        if (results.affectedRows > 0) {
          return standardResponse(res, 'Category created successfully', null)
        } else {
          return standardResponse(res, 'An error occurred', null, 400)
        }
      } else {
        return standardResponse(res, `Error : ${err.sqlMessage}`, null, 400)
      }
    })
  } else {
    return standardResponse(res, 'You dont have any permission!', null, 400)
  }
}
exports.getCategories = (req, res) => {
  const data = req.query
  data.limit = parseInt(data.limit) || 12
  data.offset = parseInt(data.offset) || 0
  data.page = parseInt(data.page) || 1
  data.offset = (data.page * data.limit) - data.limit

  categoryModel.getCategory(data, (err, results, _fields) => {
    if (!err) {
      categoryModel.getCountCategory((err, resultCount, _fields) => {
        if (!err) {
          const totalData = resultCount[0].count
          const lastPage = Math.ceil(totalData / data.limit)
          pageInfo.totalData = totalData
          pageInfo.currentPage = data.page
          pageInfo.lastPage = lastPage
          pageInfo.limitData = data.limit
          pageInfo.nextPage = data.page < lastPage ? `${APP_URL}/categories?page=${data.page + 1}` : null
          pageInfo.prevPage = data.page > 1 ? `${APP_URL}/categories?page=${data.page - 1}` : null
          return standardResponse(res, 'List Category', results, 200, pageInfo)
        } else {
          return standardResponse(res, 'Bad request', null, 400, pageInfo)
        }
      })
    } else {
      return standardResponse(res, 'List Category not found', null, 404, pageInfo)
    }
  })
}

exports.getProductsByCategory = (req, res) => {
  const data = req.query
  data.limit = parseInt(data.limit) || 12
  data.offset = parseInt(data.offset) || 0
  data.page = parseInt(data.page) || 1
  data.offset = (data.page * data.limit) - data.limit
  const { id } = req.params
  getProductsByCategory(id, data, (err, results, _fields) => {
    if (!err) {
      categoryModel.getCountProductByCategory(id, (err, resultCount, _fields) => {
        if (!err) {
          const totalData = resultCount[0].count
          const lastPage = Math.ceil(totalData / data.limit)
          pageInfo.totalData = totalData
          pageInfo.currentPage = data.page
          pageInfo.lastPage = lastPage
          pageInfo.limitData = data.limit
          pageInfo.nextPage = data.page < lastPage ? `${APP_URL}/categories/${id}/products?page=${data.page + 1}` : null
          pageInfo.prevPage = data.page > 1 ? `${APP_URL}/categories/${id}/products?page=${data.page - 1}` : null
          return standardResponse(res, 'List products by category', results, 200, pageInfo)
        }
      })
    } else {
      return standardResponse(res, `Error : ${err.sqlMessage}`, null, 400)
    }
  })
}
exports.updateCategoryPartial = async (req, res) => {
  const { id } = req.params
  const userRole = await getUserRoleAsync(req.authUser.id)

  if (userRole[0].role === 'Admin') {
    categoryModel.getCategoryById(id, (err, results, _fields) => {
      if (!err) {
        if (results.length > 0) {
          const key = Object.keys(req.body)
          if (key.length > 1) {
            return standardResponse(res, 'System just need one column', null, 400)
          } else {
            const firstColumn = key[0]
            const updateData = { id, [firstColumn]: req.body[firstColumn] }
            categoryModel.updateCategoryPartial(updateData, (err, results, _fields) => {
              if (!err) {
                return standardResponse(res, 'Category updated successfully', null, 200)
              } else {
                return standardResponse(res, 'Category failed to update', null, 400)
              }
            })
          }
        } else {
          return standardResponse(res, 'Category not found', null, 404)
        }
      }
    })
  } else {
    return standardResponse(res, 'You dont have any permission!', null, 400)
  }
}

exports.updateCategory = async (req, res) => {
  const { id } = req.params
  const userRole = await getUserRoleAsync(req.authUser.id)

  if (userRole[0].role === 'Admin') {
    categoryModel.getCategoryById(id, (err, results, _fields) => {
      if (!err) {
        if (results.length > 0) {
          const { name } = req.body
          const updateData = { id, name }
          categoryModel.updateCategory(updateData, (err, results, _fields) => {
            if (!err) {
              return standardResponse(res, 'Category updated successfully', null, 200)
            } else {
              return standardResponse(res, 'An error occurred', null, 400)
            }
          })
        } else {
          return standardResponse(res, 'Category not found!', null, 404)
        }
      }
    })
  } else {
    return standardResponse(res, 'You dont have any permission!', null, 400)
  }
}

exports.deleteCategory = async (req, res) => {
  const { id } = req.params
  const userRole = await getUserRoleAsync(req.authUser.id)

  if (userRole[0].role === 'Admin') {
    categoryModel.getCategoryById(id, (err, results, _fields) => {
      if (!err) {
        if (results.length > 0) {
          categoryModel.deleteCategory(id, (err, results, _fields) => {
            if (!err) {
              return standardResponse(res, 'Category has been deleted!', null, 200)
            } else {
              return standardResponse(res, 'Category not found!', null, 404)
            }
          })
        } else {
          return standardResponse(res, 'Category not found!', null, 404)
        }
      }
    })
  } else {
    return standardResponse(res, 'You dont have any permission!', null, 400)
  }
}
