/* eslint-disable no-unused-vars */
const { response } = require('../helpers/standardResponse')
const { createUsers, getUserByEmail, getUserByPhone } = require('../models/users')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const { APP_KEY } = process.env
const { validationResult } = require('express-validator')

exports.register = async (req, res) => {
  const data = req.body
  // const err = validationResult(req)

  // if (!err.isEmpty()) {
  //   return response(res, err.array()[0].msg, null, 400)
  // }
  data.password = await bcrypt.hash(data.password, await bcrypt.genSalt())
  const results = await getUserByEmail(data.email)
  if (results.length > 0) {
    return response(res, 'email is already in use', null, 400)
  }
  const resultphone = await getUserByPhone(data.phone_number)
  if (resultphone.length > 0) {
    return response(res, 'phone number is already in use', null, 400)
  }
  createUsers(data, (err, results) => {
    if (!err) {
      return response(res, 'registration successfully', null, 200)
    } else {
      return response(res, 'registration failed', null, 400)
    }
  })
}

exports.login = async (req, res) => {
  const { email, password } = req.body
  // const err = validationResult(req)
  // if (!err.isEmpty()) {
  //   return response(res, err.array()[0].msg, null, 400)
  // }
  const results = await getUserByEmail(email)
  if (results.length < 1) {
    return response(res, 'email not found', null, 400)
  }
  const compare = await bcrypt.compare(password, results[0].password)
  if (compare) {
    const payload = { id: results[0].id, email: results[0].email }
    const token = jwt.sign(payload, APP_KEY, { expiresIn: '2 day' })
    return response(res, 'Login success', { token }, 200)
  } else {
    return response(res, 'email or password is false', null, 401)
  }
}
