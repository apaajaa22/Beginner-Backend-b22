const route = require('express').Router()
const { createChat, getChatRoom, getUserChat, findUsers } = require('../controller/chats')
const profileController = require('../controller/profile')
const { createTransaction, getTransactionByIdOn, getTransactionDetail, deleteHistory } = require('../controller/transactions')
const uploadFilter = require('../helpers/upload')
const auth = require('../middlewares/auth')

route.get('/profile', auth, profileController.getProfile)
route.post('/profile', auth, profileController.createProfile)
route.put('/profile', uploadFilter, auth, profileController.updateProfile)
route.put('/profile/change_password', auth, profileController.ChangeProfilePassword)
route.patch('/profile', auth, profileController.updateProfilePartial)
route.delete('/profile', auth, profileController.deleteProfile)

route.post('/transactions', auth, createTransaction)
route.get('/transactions', auth, getTransactionByIdOn)
route.get('/transactions/:id', auth, getTransactionDetail)
route.delete('/transactions/:id', auth, deleteHistory)

route.post('/chats', auth, createChat)
route.get('/chats/all', auth, getChatRoom)
route.get('/chats/list', auth, getUserChat)
route.get('/chats/users', auth, findUsers)
module.exports = route
