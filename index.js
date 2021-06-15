require('dotenv').config()

const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')

const { APP_PORT, APP_UPLOAD_ROUTE, APP_UPLOAD_PATH } = process.env

const app = express()
app.use(bodyParser.urlencoded({ extended: false }))
app.use(cors())
app.use(APP_UPLOAD_ROUTE, express.static(APP_UPLOAD_PATH))
app.get('/', (req, res) => {
  return res.json({
    success: true,
    message: 'Backend is running well'
  })
})

const routeProduct = require('./src/routes/products')
const routeCategory = require('./src/routes/categories')
const routeVariant = require('./src/routes/variants')
const routeProfile = require('./src/routes/profile')
const routeAuth = require('./src/routes/auth')

app.use('/products', routeProduct)
app.use('/categories', routeCategory)
app.use('/variants', routeVariant)
app.use('/private', routeProfile)
app.use('/auth', routeAuth)

app.listen(APP_PORT, () => {
  console.log(`listening on port ${APP_PORT}`)
})
