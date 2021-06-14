const { createCategory, getCategories, getProductsByCategory, updateCategory, deleteCategory, updateCategoryPartial } = require('../controller/categories')

const route = require('express').Router()

route.post('/', createCategory)
route.get('/', getCategories)
route.get('/:id/products', getProductsByCategory)
route.put('/:id', updateCategory)
route.patch('/:id', updateCategoryPartial)
route.delete('/:id', deleteCategory)

module.exports = route
