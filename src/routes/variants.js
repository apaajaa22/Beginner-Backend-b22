const route = require('express').Router()

const variantController = require('../controller/variants')
route.post('/', variantController.createVariants)
route.get('/', variantController.getVariants)
route.put('/:id', variantController.updateVariants)
route.patch('/:id', variantController.updateVariantsPartial)
route.delete('/:id', variantController.deleteVariants)

module.exports = route
