require('dotenv').config()

const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const socket = require('./src/middlewares/socket')

const { PORT, APP_UPLOAD_ROUTE, APP_UPLOAD_PATH } = process.env

const app = express()
const server = require('http').createServer(app)
const io = require('socket.io')(server, {
  cors: {
    origin: 'https://b22-coffeeshop-rahadian.netlify.app'
  }
})

io.on('connection', () => {
  console.log('socket connection is running')
})

app.use(bodyParser.urlencoded({ extended: false }))
app.use(cors())
app.use(socket(io))
app.use(APP_UPLOAD_ROUTE, express.static(APP_UPLOAD_PATH))
app.get('/', (req, res) => {
  return res.json({
    success: true,
    message: 'Backend is running well '
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

server.listen(PORT, () => {
  console.log(`listening on port ${PORT}`)
})
