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
      done()
    }).catch((err) => {
      done(err)
    })
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
      done()
    }).catch((err) => {
      done(err)
    })
  })
})

describe('Get Transaction Detail', () => {
  it('Get history detail successfully', (done) => {
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
      done()
    })
    .catch((err) => {
      done(err)
    })
  })

  it('History not found', (done) => {
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
      done()
    })
    .catch((err) => {
      done(err)
    })
  })
})

describe('Delete Transaction', () => {
    it('History not found', (done) => {
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
        done()
      })
      .catch((err) => {
        done(err)
      })
    })

    // it('History has been deleted', (done) => {
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
    //     done()
    //   })
    //   .catch((err) => {
    //     done(err)
    //   })
    // })
})


describe('Create Transaction', () => {
  it('address must be filled', (done) => {
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
    done()
    })
    .catch((err) => {
      done(err)
    })
  })

  it('user not found', (done) => {
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
    done()
    })
    .catch((err) => {
      done(err)
    })
  })

  it('product not found', (done) => {
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
    done()
    })
    .catch((err) => {
      done(err)
    })
  })

  it('transaction successfully created', (done) => {
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
    done()
    })
    .catch((err) => {
      done(err)
    })
  })
})
