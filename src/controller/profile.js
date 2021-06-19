
const { response } = require('../helpers/standardResponse')
const { getProfile, updateProfile, updateProfilePartial, deleteProfile, createProfile, changeProfilePassword } = require('../models/profile')
const bcrypt = require('bcrypt')
const { validationResult } = require('express-validator')

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
  getProfile(req.authUser.id, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        const data = req.body

        updateProfile(data, req.authUser.id, (err, results, _fields) => {
          if (!err) {
            return response(res, 'Profile updated successfully', null, 200)
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
