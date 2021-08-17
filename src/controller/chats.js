const { response } = require('../helpers/standardResponse')
const { checkPhone, updateChat, createChat, getAllChatRoom, getUserChat, findUsers, deleteChat } = require('../models/chats')
const { getUserById } = require('../models/users')
const { APP_URL } = process.env

exports.createChat = (req, res) => {
  const { recipient } = req.body
  const phone = { phone: recipient }
  checkPhone(phone, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        getUserById(req.authUser.id, (err, resultsMe, _fields) => {
          if (!err) {
            const form = {
              sender: resultsMe[0].phone_number,
              recipient: recipient
            }
            updateChat(form, (err, results, _fields) => {
              if (!err) {
                const formData = {
                  sender: resultsMe[0].phone_number,
                  recipient: recipient,
                  message: req.body.message
                }
                createChat(formData, (err, results, _fields) => {
                  if (!err) {
                    req.socket.emit('recipient', {
                      message: req.body.message,
                      sender: resultsMe[0].phone_number
                    })
                    // req.socket.emit('hello', 'world')
                    return response(res, 'send message success', null, 200)
                  } else {
                    return response(res, 'failed to send a message', null, 400)
                  }
                })
              } else {
                return response(res, 'failed to update islatest', null, 400)
              }
            })
          } else {
            return response(res, 'not ok', null, 404)
          }
        })
      } else {
        return response(res, 'phone not found', null, 404)
      }
    } else {
      return response(res, 'not ok', null, 500)
    }
  })
}

exports.getChatRoom = (req, res) => {
  const { recipient } = req.query
  const phone = { phone: recipient }
  checkPhone(phone, (err, resultsAnotherUser, _fields) => {
    if (!err) {
      resultsAnotherUser.forEach((pic, index) => {
        if (
          resultsAnotherUser[index].picture !== null &&
          !resultsAnotherUser[index].picture.startsWith('http')
        ) {
          resultsAnotherUser[index].picture = `${APP_URL}${resultsAnotherUser[index].picture}`
        }
      })
      getUserById(req.authUser.id, (err, resultsMe, _fields) => {
        if (!err) {
          resultsMe.forEach((pic, index) => {
            if (
              resultsMe[index].picture !== null &&
              !resultsMe[index].picture.startsWith('http')
            ) {
              resultsMe[index].picture = `${APP_URL}${resultsMe[index].picture}`
            }
          })
          const form = {
            sender: resultsMe[0].phone_number,
            recipient: recipient
          }
          getAllChatRoom(form, (err, results, _fields) => {
            if (!err) {
              const form = {
                sender: {
                  name: resultsMe[0].name,
                  picture: resultsMe[0].picture,
                  phone: resultsMe[0].phone_number
                },
                recipient: {
                  name: resultsAnotherUser[0]?.name,
                  picture: resultsAnotherUser[0]?.picture,
                  phone: resultsAnotherUser[0]?.phone_number
                },
                message: results
              }
              return response(res, 'list chat room', form, 200)
            } else {
              return response(res, 'chat room not found', form, 404)
            }
          })
        } else {
          return response(res, 'user not found', null, 404)
        }
      })
    } else {
      return response(res, 'an error occured', null, 500)
    }
  })
}

exports.getUserChat = (req, res) => {
  const { recipient } = req.body
  const phone = { phone: recipient }
  checkPhone(phone, (err, resultsAnotherUser, _fields) => {
    if (!err) {
      resultsAnotherUser.forEach((pic, index) => {
        if (
          resultsAnotherUser[index].picture !== null &&
          !resultsAnotherUser[index].picture.startsWith('http')
        ) {
          resultsAnotherUser[index].picture = `${APP_URL}${resultsAnotherUser[index].picture}`
        }
      })
      getUserById(req.authUser.id, (err, resultsMe, _fields) => {
        if (!err) {
          resultsMe.forEach((pic, index) => {
            if (
              resultsMe[index].picture !== null &&
              !resultsMe[index].picture.startsWith('http')
            ) {
              resultsMe[index].picture = `${APP_URL}${resultsMe[index].picture}`
            }
          })
          const form = {
            sender: resultsMe[0].phone_number,
            recipient: resultsMe[0].phone_number
          }
          getUserChat(form, (err, results, _fields) => {
            if (!err) {
              results.forEach((pic, index) => {
                if (
                  results[index].picture !== null &&
                  !results[index].picture.startsWith('http')
                ) {
                  results[index].picture = `${APP_URL}${results[index].picture}`
                }
              })
              const form = {
                message: results
              }
              return response(res, 'list chat room', form, 200)
            }
          })
        } else {
          return response(res, 'user not found', null, 404)
        }
      })
    } else {
      return response(res, 'an error occured', null, 500)
    }
  })
}

exports.findUsers = (req, res) => {
  const data = req.query
  data.search = data.search || ''
  data.col = data.col || 'name'
  findUsers(data, (err, results, _fields) => {
    if (!err) {
      results.forEach((pic, index) => {
        if (
          results[index].picture !== null &&
          !results[index].picture.startsWith('http')
        ) {
          results[index].picture = `${APP_URL}${results[index].picture}`
        }
      })
      return response(res, 'list users', results, 200)
    } else {
      return response(res, 'users not found', null, 404)
    }
  })
}

exports.deleteChat = (req, res) => {
  const { id } = req.params
  deleteChat(id, (err, results, _fields) => {
    if (!err) {
      return response(
        res,
        'chat has been deleted!',
        null,
        200
      )
    } else {
      return response(res, 'chat not found!', null, 404)
    }
  })
}
