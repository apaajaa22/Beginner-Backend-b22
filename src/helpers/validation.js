const { response: standardResponse } = require('./standardResponse')

exports.validateInteger = (res, data, fields, cb) => {
  if (data) {
    data = parseInt(data)
    if (data < 1) {
      return standardResponse(res, `${fields} at least 1`, null, 400)
    } else {
      cb()
    }
  }
}
