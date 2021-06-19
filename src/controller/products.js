const productModel = require("../models/products");
const { response: standardResponse } = require("../helpers/standardResponse");
const { validateInteger } = require("../helpers/validation");
const { createProductCategory } = require("../models/productCategories");
const { createProductVariants } = require("../models/productVariants");
const productPicture = require("../helpers/upload").single("picture");
const { APP_URL, APP_UPLOAD_ROUTE } = process.env;
const { getUserRoleAsync } = require("../models/users");

exports.createProduct = async (req, res) => {
  const userRole = await getUserRoleAsync(req.authUser.id);
  if (userRole[0].role === "Admin") {
    productPicture(req, res, (err) => {
      if (!err) {
        validateInteger(res, req.body.price, "Price", () => {
          validateInteger(res, req.body.quantity, "Quantity", () => {
            req.body.picture = req.file
              ? `${APP_UPLOAD_ROUTE}/${req.file.filename}`
              : null;
            productModel.createProduct(req.body, (err, results, _fields) => {
              if (!err) {
                if (results.affectedRows > 0) {
                  if (typeof req.body.category !== "object") {
                    req.body.category = [req.body.category];
                  }
                  if (typeof req.body.variant !== "object") {
                    req.body.variant = [req.body.variant];
                  }
                  if (typeof req.body.priceVariant !== "object") {
                    req.body.priceVariant = [req.body.priceVariant];
                  }
                  req.body.category.forEach((idCategory) => {
                    const data = {
                      id_product: results.insertId,
                      id_category: idCategory,
                    };
                    createProductCategory(data, () => {});
                  });
                  req.body.variant.forEach((idVariant, idx) => {
                    const data = {
                      id_product: results.insertId,
                      id_variant: idVariant,
                      additional_price: req.body.priceVariant[idx],
                    };
                    createProductVariants(data, () => {});
                  });
                  return standardResponse(
                    res,
                    "Product created successfully",
                    null,
                    200
                  );
                } else {
                  return standardResponse(res, "An error occurred", null, 400);
                }
              } else {
                console.log(err);
                return standardResponse(
                  res,
                  `Error : ${err.sqlMessage}`,
                  null,
                  400
                );
              }
            });
          });
        });
      } else {
        return standardResponse(res, "Image error", null, 400);
      }
    });
  } else {
    return standardResponse(res, "You dont have any permission!", null, 400);
  }
};

exports.getProducts = (req, res) => {
  const search = req.query?.search;
  const sort = req.query.sort;
  const order = req.query.order || "asc";
  const data = req.query;
  data.limit = parseInt(data.limit) || 5;
  data.offset = parseInt(data.offset) || 0;
  data.page = parseInt(data.page) || 1;
  data.offset = data.page * data.limit - data.limit;

  const pageInfo = {};
  if (search && sort) {
    productModel.sortProducts(
      search,
      sort,
      data,
      order,
      (err, results, _fields) => {
        if (!err) {
          productModel.getProductsCount(data, (err, resultCount, _fields) => {
            if (!err) {
              const totalData = resultCount[0].count;
              const lastPage = Math.ceil(totalData / data.limit);
              pageInfo.totalData = totalData;
              pageInfo.currentPage = data.page;
              pageInfo.lastPage = lastPage;
              pageInfo.limitData = data.limit;
              pageInfo.nextPage =
                data.page < lastPage
                  ? `${APP_URL}/products?page=${data.page + 1}`
                  : null;
              pageInfo.prevPage =
                data.page > 1
                  ? `${APP_URL}/products?page=${data.page - 1}`
                  : null;
              return standardResponse(
                res,
                "product found",
                results,
                200,
                pageInfo
              );
            } else {
              return standardResponse(
                res,
                "product not found",
                null,
                404,
                pageInfo
              );
            }
          });
        } else {
          return standardResponse(
            res,
            "product not found",
            null,
            404,
            pageInfo
          );
        }
      }
    );
  } else if (sort) {
    productModel.sortAllProducts(sort, data, order, (err, results, _fields) => {
      if (!err) {
        productModel.getCount((err, resultCount, _fields) => {
          if (!err) {
            const totalData = resultCount[0].count;
            const lastPage = Math.ceil(totalData / data.limit);
            pageInfo.totalData = totalData;
            pageInfo.currentPage = data.page;
            pageInfo.lastPage = lastPage;
            pageInfo.limitData = data.limit;
            pageInfo.nextPage =
              data.page < lastPage
                ? `${APP_URL}/products?page=${data.page + 1}`
                : null;
            pageInfo.prevPage =
              data.page > 1
                ? `${APP_URL}/products?page=${data.page - 1}`
                : null;
            return standardResponse(
              res,
              "product sorted",
              results,
              200,
              pageInfo
            );
          } else {
            return standardResponse(
              res,
              "product not found",
              null,
              404,
              pageInfo
            );
          }
        });
      } else {
        return standardResponse(res, "product not found", null, 404, pageInfo);
      }
    });
  } else if (search) {
    productModel.searchProducts(search, data, (err, results, _fields) => {
      if (!err) {
        productModel.getProductsCount(data, (err, resultCount, _fields) => {
          if (!err) {
            const totalData = resultCount[0].count;
            const lastPage = Math.ceil(totalData / data.limit);
            pageInfo.totalData = totalData;
            pageInfo.currentPage = data.page;
            pageInfo.lastPage = lastPage;
            pageInfo.limitData = data.limit;
            pageInfo.nextPage =
              data.page < lastPage
                ? `${APP_URL}/products?page=${data.page + 1}`
                : null;
            pageInfo.prevPage =
              data.page > 1
                ? `${APP_URL}/products?page=${data.page - 1}`
                : null;
            if (results.length < 1) {
              return standardResponse(res, "product not found", null, 404);
            } else {
              return standardResponse(
                res,
                "product found",
                results,
                200,
                pageInfo
              );
            }
          } else {
            return standardResponse(
              res,
              "product not found",
              null,
              404,
              pageInfo
            );
          }
        });
      } else {
        return standardResponse(res, "product not found", null, 404, pageInfo);
      }
    });
  } else {
    productModel.getProducts(data, (err, results, _fields) => {
      if (!err) {
        productModel.getCount((err, resultCount, _fields) => {
          if (!err) {
            const totalData = resultCount[0].count;
            const lastPage = Math.ceil(totalData / data.limit);
            pageInfo.totalData = totalData;
            pageInfo.currentPage = data.page;
            pageInfo.lastPage = lastPage;
            pageInfo.limitData = data.limit;
            pageInfo.nextPage =
              data.page < lastPage
                ? `${APP_URL}/products?page=${data.page + 1}`
                : null;
            pageInfo.prevPage =
              data.page > 1
                ? `${APP_URL}/products?page=${data.page - 1}`
                : null;
            return standardResponse(
              res,
              "product found",
              results,
              200,
              pageInfo
            );
          } else {
            return standardResponse(
              res,
              "product not found",
              results,
              404,
              pageInfo
            );
          }
        });
      }
    });
  }
};

exports.getProductDetails = (req, res) => {
  const { id } = req.params;
  productModel.getProductDetails(id, (err, results, _fields) => {
    if (!err) {
      if (results.length > 0) {
        const item = results[0];
        if (item.picture !== null && !item.picture.startsWith("http")) {
          item.picture = `${APP_URL}${item.picture}`;
        }
        const data = {
          id: "",
          picture: "",
          name: "",
          description: "",
          quantity: "",
          delivery_on: "",
          variants: [],
          created_at: "",
          updated_at: "",
          ...results[0],
        };
        const hiddenColumn = [
          "additional_price",
          "end_price",
          "variant",
          "variant_code",
        ];
        hiddenColumn.forEach((column) => {
          delete data[column];
        });
        results.forEach((product) => {
          data.variants.push({
            name: product.variant,
            code: product.variant_code,
            base_price: product.base_price,
            price: product.end_price,
          });
        });
        return standardResponse(res, "Detail product", data);
      }
    }
  });
};

exports.updateProductPartial = async (req, res) => {
  const { id } = req.params;
  const userRole = await getUserRoleAsync(req.authUser.id);
  if (userRole[0].role === "Admin") {
    productModel.getProductById(id, (err, results, _fields) => {
      if (!err) {
        if (results.length > 0) {
          const key = Object.keys(req.body);
          if (key.length > 1) {
            return standardResponse(
              res,
              "System just need one column",
              null,
              400
            );
          } else {
            const firstColumn = key[0];
            const updateData = { id, [firstColumn]: req.body[firstColumn] };
            productModel.updateProductPartial(
              updateData,
              (err, results, _fields) => {
                if (!err) {
                  return standardResponse(
                    res,
                    "Product updated successfully",
                    null,
                    200
                  );
                } else {
                  return standardResponse(
                    res,
                    "Product failed to update",
                    null,
                    400
                  );
                }
              }
            );
          }
        } else {
          return standardResponse(res, "Product not found", null, 404);
        }
      }
    });
  } else {
    standardResponse(res, "You dont have any permission", null, 400);
  }
};

exports.updateProduct = async (req, res) => {
  const { id } = req.params;
  const userRole = await getUserRoleAsync(req.authUser.id);

  if (userRole[0].role === "Admin") {
    productModel.getProductById(id, (err, results, _fields) => {
      if (!err) {
        if (results.length > 0) {
          const { name, price } = req.body;
          const updateData = { id, name, price };
          productModel.updateProduct(updateData, (err, results, _fields) => {
            if (!err) {
              return standardResponse(
                res,
                "Item updated successfully",
                null,
                200
              );
            } else {
              return standardResponse(res, "An error occurred", null, 400);
            }
          });
        } else {
          return standardResponse(res, "Item not found!", null, 404);
        }
      }
    });
  } else {
    standardResponse(res, "You dont have any permission", null, 400);
  }
};

exports.deleteProduct = async (req, res) => {
  const { id } = req.params;
  const userRole = await getUserRoleAsync(req.authUser.id);

  if (userRole[0].role === "Admin") {
    productModel.getProductById(id, (err, results, _fields) => {
      if (!err) {
        if (results.length > 0) {
          productModel.deleteProduct(id, (err, results, _fields) => {
            if (!err) {
              return standardResponse(
                res,
                "product has been deleted!",
                null,
                200
              );
            } else {
              return standardResponse(res, "product not found!", null, 404);
            }
          });
        } else {
          return standardResponse(res, "product not found!", null, 404);
        }
      }
    });
  } else {
    standardResponse(res, "You dont have any permission", null, 400);
  }
};
