
const { response } = require('../helpers/standardResponse')
const { getProfile, updateProfile, updateProfilePartial, deleteProfile, createProfile, changeProfilePassword, updateProfile2 } = require('../models/profile')
const bcrypt = require('bcrypt')
const { validationResult } = require('express-validator')
const { APP_URL, APP_UPLOAD_ROUTE, APP_UPLOAD_PATH } = process.env
const fs = require('fs')

exports.createProfile = async (req, res) => {
  const err = validationResult(req)
  const data = req.body

  if (!err.isEmpty()) {
    return response(res, err.array()[0].msg, null, 400)
  }
  data.password = await bcrypt.hash(data.password, await bcrypt.genSalt())
  createProfile(data, (err, results) => {
    if (!err) {
      if (results.affectedRows) {
        return response(res, 'create profile successfully', null, 200)
      } else {
        return response(res, 'create profile failed', null, 400)
      }
    } else {
      return response(res, 'Internal server error', null, 500)
    }
  })
}

exports.getProfile = (req, res) => {
  getProfile(req.authUser.id, (err, results) => {
    if (!err) {
      results.forEach((pic, index) => {
        if (
          results[index].picture !== null &&
          !results[index].picture.startsWith('http')
        ) {
          results[index].picture = `${APP_URL}${results[index].picture}`
        }
      })
      return response(res, 'Profile Detail', results, 200)
    } else {
      return response(res, 'Profile not found', null, 404)
    }
  })
}

exports.ChangeProfilePassword = (req, res) => {
  getProfile(req.authUser.id, async (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        const data = req.body
        data.password = await bcrypt.hash(data.password, await bcrypt.genSalt())
        changeProfilePassword(data, req.authUser.id, (err, results, _fields) => {
          if (!err) {
            return response(res, 'Password updated!', null, 200)
          } else {
            return response(res, 'An error occurred', null, 400)
          }
        })
      } else {
        return response(res, 'Profile not found!', null, 404)
      }
    }
  })
}

exports.updateProfile = (req, res) => {
  getProfile(req.authUser.id, (err, oldResults, _fields) => {
    console.log('old', oldResults)
    if (!err) {
      if (oldResults.length > 0) {
        req.body.picture = req.file
          ? `${APP_UPLOAD_ROUTE}/${req.file.filename}`
          : null
        const { name, email, address, number, picture, gender, birth } = req.body
        if (picture) {
          const updateData = { name, email, address, phone_number: number, picture, gender, birth }
          updateProfile(updateData, req.authUser.id, (err, results, _fields) => {
            if (!err) {
              if (oldResults[0].picture !== null) {
                const oldpath = oldResults[0].picture
                const path = oldpath.split('/')
                // fs.unlinkSync(APP_URL + APP_UPLOAD_ROUTE + '/' + path[2])
                console.log(APP_URL + APP_UPLOAD_ROUTE + '/' + path[2])
                return response(res, 'Profile updated successfully', null, 200)
              } else {
                return response(res, 'Profile updated successfully', null, 200)
              }
            } else {
              return response(res, 'An error occurred', null, 400)
            }
          })
        } else {
          const updateData = { name, email, address, phone_number: number, gender, birth }
          updateProfile2(updateData, req.authUser.id, (err, results, _fields) => {
            if (!err) {
              return response(res, 'Profile updated successfully', null, 200)
            } else {
              return response(res, 'An error occurred', null, 400)
            }
          })
        }
      } else {
        return response(res, 'Profile not found!', null, 404)
      }
    } else {
      return response(res, 'Profile not found!', null, 404)
    }
  })
}

exports.profileUpdate = (req, res) => {
  getProfile(req.authUser.id, (err, results, _fields) => {
    if (err) throw err
    const { name, email, address, phone_number: number } = req.body
    return res.send({
      success: true,
      message: 'Profile updated successfully',
      results: {
        name,
        email,
        address,
        number,
        picture: `${APP_URL}${APP_UPLOAD_ROUTE}/${req.file.filename}`
      }
    })
  })
}

exports.updateProfilePartial = (req, res) => {
  const { id } = req.authUser
  getProfile(id, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        const key = Object.keys(req.body)
        if (key.length > 1) {
          return response(res, 'System just need one column', null, 400)
        } else {
          const firstColumn = key[0]
          const updateData = { id, [firstColumn]: req.body[firstColumn] }
          updateProfilePartial(updateData, (err, results, _fields) => {
            if (!err) {
              return response(res, 'Profile updated successfully', null, 200)
            } else {
              return response(res, 'Profile failed to update', null, 400)
            }
          })
        }
      } else {
        return response(res, 'Profile not found', null, 404)
      }
    }
  })
}

exports.deleteProfile = (req, res) => {
  const { id } = req.authUser
  getProfile(id, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        deleteProfile(id, (err, results, _fields) => {
          if (!err) {
            return response(res, 'Profile has been deleted!', null, 200)
          } else {
            return response(res, 'Profile not found!', null, 404)
          }
        })
      } else {
        return response(res, 'Profile not found!', null, 404)
      }
    }
  })
}
