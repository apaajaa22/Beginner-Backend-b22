const {getTransactionByIdOn} = require('../src/controller/transactions')
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

describe('get transaction by user login', () => {
  it('have history transaction', () => {
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
  })

  it('History user not found', () => {
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
  })
})
