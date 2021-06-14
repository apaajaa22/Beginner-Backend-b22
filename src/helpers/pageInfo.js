const { APP_URL } = process.env

exports.pageInfoProducts = (req, resultCount) => {
  const data = req.query
  data.limit = parseInt(data.limit) || 5
  data.offset = parseInt(data.offset) || 0
  data.page = parseInt(data.page) || 1
  data.offset = (data.page * data.limit) - data.limit
  const pageInfo = {}
  const totalData = resultCount[0].count
  const lastPage = Math.ceil(totalData / data.limit)
  pageInfo.totalData = totalData
  pageInfo.currentPage = data.page
  pageInfo.lastPage = lastPage
  pageInfo.limitData = data.limit
  pageInfo.nextPage = data.page < lastPage ? `${APP_URL}/products?page=${data.page + 1}` : null
  pageInfo.prevPage = data.page > 1 ? `${APP_URL}/products?page=${data.page - 1}` : null
}
