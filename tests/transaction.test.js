const {getTransactionByIdOn, getTransactionDetail, deleteHistory, createTransaction} = require('../src/controller/transactions')
const sinon = require('sinon')
const supertest = require('supertest')
const {APP_URL} = process.env
const {expect, should, assert} = require('chai')
const { response } = require('../src/helpers/standardResponse')

const mockingResponse = () => {
  const res = {}
  res.status = sinon.stub().returns(res)
  res.json = sinon.stub().returns(res)
  return res
}

describe('Get transaction by user login', () => {
  it('have history transaction', (done) => {
    let req = {
      authUser: {
        id: 3
      }
    }
    const res = mockingResponse()
    getTransactionByIdOn(req,res)
    .then((data) => {
      expect(data.json.args[0][0].success).to.be.true
      expect(data.json.args[0][0].message).equal('History Transaction')
      expect(data.status.args[0][0]).equal(200)
    }).catch((err) => {
      console.log(err)
    })
    done()
  })

  it('History user not found', (done) => {
    let req = {
      authUser: {
        id: 30
      }
    }
    const res = mockingResponse()
    getTransactionByIdOn(req,res)
    .then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.json.args[0][0].message).equal('History not found')
      expect(data.status.args[0][0]).equal(404)
    }).catch((err) => {
      console.log(err)
    })
    done()
  })
})

describe('Get Transaction Detail', () => {
  it('Get history detail successfully', () => {
    let req = {
      authUser: {
        id: 3
      },
      params: {
        id: 31
      }
    }
    const res = mockingResponse()
    getTransactionDetail(req,res)
    .then((data) => {
      expect(data.json.args[0][0].success).to.be.true
      expect(data.status.args[0][0]).equal(200)
      expect(data.json.args[0][0].message).equal('History Detail')
    })
    .catch((err) => {
      console.log(err)
    })
  })

  it('History not found', () => {
    let req = {
      authUser: {
        id: 3
      },
      params: {
        id: 344
      }
    }
    const res = mockingResponse()
    getTransactionDetail(req,res)
    .then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(404)
      expect(data.json.args[0][0].message).equal('History not found')
    })
    .catch((err) => {
      console.log(err)
    })
  })
})

describe('Delete Transaction', () => {
    it('History not found', () => {
      let req = {
        params: {
          id: 344
        }
      }
      const res = mockingResponse()
      deleteHistory(req,res)
      .then((data) => {
        expect(data.json.args[0][0].success).to.be.false
        expect(data.status.args[0][0]).equal(404)
        expect(data.json.args[0][0].message).equal('history not found!')
      })
      .catch((err) => {
        console.log(err)
      })
    })

    // it('History has been deleted', () => {
    //   let req = {
    //     params: {
    //       id: 224
    //     }
    //   }
    //   const res = mockingResponse()
    //   deleteHistory(req,res)
    //   .then((data) => {
    //     expect(data.json.args[0][0].success).to.be.true
    //     expect(data.status.args[0][0]).equal(200)
    //     expect(data.json.args[0][0].message).equal('history has been deleted!')
    //   })
    //   .catch((err) => {
    //     console.log(err)
    //   })
    // })

})


describe('Create Transaction', () => {
  it('address must be filled', () => {
    let req = {
      authUser: {
        id: 2
      },
      body: {
        product_id: [12,3],
        product_amount: [5,2],
        product_variant: [1,1],
        payment_method: 'Bank',
      }
    }
    const res = mockingResponse()
    createTransaction(req,res)
    .then((res) => {
    expect(res.status.args[0][0]).equal(400)
    expect(res.json.args[0][0].success).to.be.false
    expect(res.json.args[0][0].message).equal('address must be filled')
    })
    .catch((err) => {
      console.log(err)
    })
  })

  it('user not found', () => {
    let req = {
      authUser: {
        id: 10
      },
      body: {
        product_id: '12',
        product_amount: '5',
        product_variant: '1',
        payment_method: 'Bank',
      }
    }
    const res = mockingResponse()
    createTransaction(req,res)
    .then((res) => {
      expect(res.status.args[0][0]).equal(404)
    expect(res.json.args[0][0].success).to.be.false
    expect(res.json.args[0][0].message).equal('user not found!')
    })
    .catch((err) => {
      console.log(err)
    })
  })

  it('product not found', () => {
    let req = {
      authUser: {
        id: 3
      },
      body: {
        product_id: '1200',
        product_amount: '5',
        product_variant: '1',
        payment_method: 'Bank',
      }
    }
    const res = mockingResponse()
    createTransaction(req,res)
    .then((res) => {
    expect(res.status.args[0][0]).equal(404)
    expect(res.json.args[0][0].success).to.be.false
    expect(res.json.args[0][0].message).equal('id product not found!')
    })
    .catch((err) => {
      console.log(err)
    })
  })

  it('transaction successfully created', () => {
    let req = {
      authUser: {
        id: 3
      },
      body: {
        product_id: [12,3],
        product_amount: [5,2],
        product_variant: [1,1],
        payment_method: 'Bank',
      }
    }
    const res = mockingResponse()
    createTransaction(req,res)
    .then((res) => {
    expect(res.status.args[0][0]).equal(200)
    expect(res.json.args[0][0].success).to.be.true
    expect(res.json.args[0][0].message).equal('transaction successfully created')

    })
    .catch((err) => {
      console.log(err)
    })
  })
})
