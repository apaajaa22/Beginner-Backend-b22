const jwt = require('jsonwebtoken')
const { response } = require('../helpers/standardResponse')
const { APP_KEY } = process.env

const auth = (req, res, next) => {
  if (req.headers?.authorization) {
    if (req.headers.authorization.startsWith('Bearer')) {
      try {
        const token = req.headers.authorization.slice(7)
        const user = jwt.verify(token, APP_KEY)
        req.authUser = user
        next()
      } catch (err) {
        return response(res, 'You must be loggin first', null, 401)
      }
    }
  } else {
    return response(res, 'Auth token is needed!', null, 401)
  }
}

module.exports = auth
