const route = require('express').Router()
const auth = require('../middlewares/auth')
const variantController = require('../controller/variants')

route.post('/', auth, variantController.createVariants)
route.get('/', variantController.getVariants)
route.put('/:id', auth, variantController.updateVariants)
route.patch('/:id', auth, variantController.updateVariantsPartial)
route.delete('/:id', auth, variantController.deleteVariants)

module.exports = route
