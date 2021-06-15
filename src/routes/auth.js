const { register, login } = require('../controller/auth')
const { checkSchema } = require('express-validator')

const route = require('express').Router()
route.post('/register', checkSchema(require('../helpers/validationSchema/register')), register)
route.post('/login', checkSchema(require('../helpers/validationSchema/login')), login)
module.exports = route
