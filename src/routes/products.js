const route = require('express').Router()

const productController = require('../controller/products')
const auth = require('../middlewares/auth')

route.get('/', productController.getProducts)
route.get('/:id', productController.getProductDetails)
route.post('/', auth, productController.createProduct)
route.put('/:id', auth, productController.updateProduct)
route.patch('/:id', auth, productController.updateProductPartial)
route.delete('/:id', auth, productController.deleteProduct)

module.exports = route
