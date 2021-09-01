/* eslint-disable no-unused-vars */
const { response } = require('../helpers/standardResponse')
const { getUserRoleAsync } = require('../models/users')
const variantModel = require('../models/variants')

exports.createVariants = async (req, res) => {
  const userRole = await getUserRoleAsync(req.authUser.id)
  if (userRole[0].role === 'Admin') {
    await variantModel.createVariants(req.body)
    return response(res, 'variant added successfully', null, 200)
  } else {
    return response(res, 'You dont have any permission!', null, 400)
  }
}

exports.getVariants = async (req, res) => {
  const resultVariant = await variantModel.getVariants()
  return response(res, 'List variants', resultVariant, 200)
}

exports.updateVariantsPartial = async (req, res) => {
  const { id } = req.params
  const userRole = await getUserRoleAsync(req.authUser.id)
  if (userRole[0].role === 'Admin') {
    const getIdVariant = await variantModel.getVariantsById(id)
    if (getIdVariant.length > 0) {
      const key = Object.keys(req.body)
      if (key.length > 1) {
        return response(res, 'System just need one column', null, 400)
      } else {
        const firstColumn = key[0]
        const updateData = { id, [firstColumn]: req.body[firstColumn] }
        await variantModel.updateVariantsPartial(updateData)
        return response(res, 'variants updated successfully', null, 200)
      }
    } else {
      return response(res, 'variant not found', null, 400)
    }
  } else {
    return response(res, 'You dont have any permission!', null, 400)
  }
}

exports.updateVariants = async (req, res) => {
  const { id } = req.params
  const userRole = await getUserRoleAsync(req.authUser.id)
  if (userRole[0].role === 'Admin') {
    const getIdVariant = await variantModel.getVariantsById(id)
    if (getIdVariant.length > 0) {
      const { name } = req.body
      const updateData = { id, name }
      await variantModel.updateVariants(updateData)
      return response(res, 'variant successfully updated', null, 200)
    } else {
      return response(res, 'variant not found', null, 400)
    }
  } else {
    return response(res, 'You dont have any permission!', null, 400)
  }
}

exports.deleteVariants = async (req, res) => {
  const { id } = req.params
  const userRole = await getUserRoleAsync(req.authUser.id)
  if (userRole[0].role === 'Admin') {
    const getIdVariant = await variantModel.getVariantsById(id)
    if (getIdVariant.length > 0) {
      await variantModel.deleteVariants(id)
      return response(res, 'variants has been deleted!', null, 200)
    } else {
      return response(res, 'variant not found', null, 400)
    }
  } else {
    return response(res, 'You dont have any permission!', null, 400)
  }
}
