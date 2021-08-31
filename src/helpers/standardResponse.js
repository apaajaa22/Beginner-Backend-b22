exports.response = (res, message, results, status, pageInfo, invoice) => {
  const returnData = {
    success: true,
    message,
    pageInfo,
    invoice
  }
  if (status >= 400) {
    returnData.success = false
  }
  if (results !== null) {
    returnData.results = results
  }
  return res.status(status).json(returnData)
}
