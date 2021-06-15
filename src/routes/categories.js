const { createCategory, getCategories, getProductsByCategory, updateCategory, deleteCategory, updateCategoryPartial } = require('../controller/categories')
const auth = require('../middlewares/auth')
const route = require('express').Router()

route.get('/', getCategories)
route.get('/:id/products', getProductsByCategory)
route.post('/', auth, createCategory)
route.put('/:id', auth, updateCategory)
route.patch('/:id', auth, updateCategoryPartial)
route.delete('/:id', auth, deleteCategory)

module.exports = route
