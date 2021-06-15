const route = require('express').Router()
const profileController = require('../controller/profile')
const { createTransaction, getTransactionByIdOn, getTransactionDetail } = require('../controller/transactions')
const auth = require('../middlewares/auth')

route.get('/profile', auth, profileController.getProfile)
route.post('/profile', auth, profileController.createProfile)
route.put('/profile', auth, profileController.updateProfile)
route.put('/profile/change_password', auth, profileController.ChangeProfilePassword)
route.patch('/profile', auth, profileController.updateProfilePartial)
route.delete('/profile', auth, profileController.deleteProfile)

route.post('/transactions', auth, createTransaction)
route.get('/transactions', auth, getTransactionByIdOn)
route.get('/transactions/:id', getTransactionDetail)
module.exports = route
