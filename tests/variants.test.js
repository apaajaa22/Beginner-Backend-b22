const {getVariants, createVariants, updateVariantsPartial, updateVariants, deleteVariants} = require('../src/controller/variants')
const sinon = require('sinon')
const supertest = require('supertest')
const {APP_URL} = process.env
const {expect, should, assert} = require('chai')
const { response } = require('../src/helpers/standardResponse')
const { getUserRoleAsync } = require('../src/models/users')

const mockingResponse = () => {
  const res = {}
  res.status = sinon.stub().returns(res)
  res.json = sinon.stub().returns(res)
  return res
}

describe('Variants', () => {
  it ('get variants', (done) => {
    let req = {}
    const res = mockingResponse()
    getVariants(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.true
      expect(data.json.args[0][0].message).equal('List variants')
      expect(data.status.args[0][0]).equal(200)
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it ('check admin', (done) => {
    let req = 3
    const res = mockingResponse()
    getUserRoleAsync(req,res).then((data) => {
      expect(data[0].role).equal('Admin')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it ('check General', (done) => {
    let req = 87
    const res = mockingResponse()
    getUserRoleAsync(req,res).then((data) => {
      expect(data[0].role).equal('General')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  // it ('create variants', (done) => {
  //   let req = {
  //     authUser: {
  //       id: 3
  //     },
  //     body: {
  //       name: 'super pedas',
  //       code: 'SP'
  //     }
  //   }
  //   const res = mockingResponse()
  //   createVariants(req,res).then((data) => {
  //     expect(data.json.args[0][0].success).to.be.true
  //     expect(data.status.args[0][0]).equal(200)
  //     expect(data.json.args[0][0].message).equal('variant added successfully')
  //     done()
  //   }).catch((err) => {
  //     done(err)
  //   })
  // })

  it ('dont have permission (CREATE)', (done) => {
    let req = {
      authUser: {
        id: 87
      },
      body: {
        name: 'super pedas',
        code: 'SP'
      }
    }
    const res = mockingResponse()
    createVariants(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(400)
      expect(data.json.args[0][0].message).equal('You dont have any permission!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('dont have permission (CREATE)(supertest)', (done) => {
    supertest(APP_URL)
    .post('/auth/login')
    .send(`email=rafi@email.com&password=123456`)
    .expect(200)
    .end((err, res) => {
      expect(res.body.success).to.be.true
      expect(res.body.message).equal('Login success')
      expect(res.body.results.token).to.be.a('string')
      supertest(APP_URL)
      .post('/variants')
      .set('Authorization', `Bearer ${res.body.results.token}`)
      .end((err, res) => {
        expect(res.body.success).to.be.false
        expect(res.status).equal(400)
        expect(res.body.message).equal('You dont have any permission!')
        done()
      })
    })
  })

  it ('dont have permission (PATCH)', (done) => {
    let req = {
      authUser: {
        id: 87
      },
      params:{
        id: 9
      },
      body: {
        name: 'super pedas',
      }
    }
    const res = mockingResponse()
    updateVariantsPartial(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(400)
      expect(data.json.args[0][0].message).equal('You dont have any permission!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it ('Just need one column to update (PATCH)', (done) => {
    let req = {
      authUser: {
        id: 3
      },
      params:{
        id: 9
      },
      body: {
        name: 'super pedas',
        size: 'XL'
      }
    }
    const res = mockingResponse()
    updateVariantsPartial(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(400)
      expect(data.json.args[0][0].message).equal('System just need one column')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it ('variants updated successfully (PATCH)', (done) => {
    let req = {
      authUser: {
        id: 3
      },
      params:{
        id: 9
      },
      body: {
        name: 'super manis',
      }
    }
    const res = mockingResponse()
    updateVariantsPartial(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.true
      expect(data.status.args[0][0]).equal(200)
      expect(data.json.args[0][0].message).equal('variants updated successfully')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('variant not found (PATCH)(supertest)', (done) => {
    supertest(APP_URL)
    .post('/auth/login')
    .send(`email=reza@email.com&password=123456`)
    .expect(200)
    .end((err, res) => {
      expect(res.body.success).to.be.true
      expect(res.body.message).equal('Login success')
      expect(res.body.results.token).to.be.a('string')
      supertest(APP_URL)
      .patch('/variants/:10')
      .set('Authorization', `Bearer ${res.body.results.token}`)
      .end((err, res) => {
        expect(res.body.success).to.be.false
        expect(res.status).equal(400)
        expect(res.body.message).equal('variant not found')
        done()
      })
    })
  })

  it ('variant not found (PATCH)', (done) => {
    let req = {
      authUser: {
        id: 3
      },
      params:{
        id: 10
      },
      body: {
        name: 'super manis',
      }
    }
    const res = mockingResponse()
    updateVariantsPartial(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(400)
      expect(data.json.args[0][0].message).equal('variant not found')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('dont have permission (PUT)(supertest)', (done) => {
    supertest(APP_URL)
    .post('/auth/login')
    .send(`email=rafi@email.com&password=123456`)
    .expect(200)
    .end((err, res) => {
      expect(res.body.success).to.be.true
      expect(res.body.message).equal('Login success')
      expect(res.body.results.token).to.be.a('string')
      supertest(APP_URL)
      .put('/variants/:10')
      .set('Authorization', `Bearer ${res.body.results.token}`)
      .end((err, res) => {
        expect(res.body.success).to.be.false
        expect(res.status).equal(400)
        expect(res.body.message).equal('You dont have any permission!')
        done()
      })
    })
  })

  it ('dont have permission (PUT)', (done) => {
    let req = {
      authUser: {
        id: 87
      },
      params:{
        id: 9
      },
      body: {
        name: 'super pedas',
      }
    }
    const res = mockingResponse()
    updateVariants(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(400)
      expect(data.json.args[0][0].message).equal('You dont have any permission!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it ('variant not found (PUT)', (done) => {
    let req = {
      authUser: {
        id: 3
      },
      params:{
        id: 10
      },
      body: {
        name: 'super manis',
      }
    }
    const res = mockingResponse()
    updateVariants(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(400)
      expect(data.json.args[0][0].message).equal('variant not found')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it ('variants updated successfully (PUT)', (done) => {
    let req = {
      authUser: {
        id: 3
      },
      params:{
        id: 9
      },
      body: {
        name: 'super manis',
      }
    }
    const res = mockingResponse()
    updateVariants(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.true
      expect(data.status.args[0][0]).equal(200)
      expect(data.json.args[0][0].message).equal('variant successfully updated')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it ('dont have permission (DELETE)', (done) => {
    let req = {
      authUser: {
        id: 87
      },
      params:{
        id: 28
      },
    }
    const res = mockingResponse()
    deleteVariants(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(400)
      expect(data.json.args[0][0].message).equal('You dont have any permission!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it ('variant not found (DELETE)', (done) => {
    let req = {
      authUser: {
        id: 3
      },
      params:{
        id: 10
      },
    }
    const res = mockingResponse()
    deleteVariants(req,res).then((data) => {
      expect(data.json.args[0][0].success).to.be.false
      expect(data.status.args[0][0]).equal(400)
      expect(data.json.args[0][0].message).equal('variant not found')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  // it ('variants has been deleted! (DELETE)', (done) => {
  //   let req = {
  //     authUser: {
  //       id: 3
  //     },
  //     params:{
  //       id: 27
  //     },
  //   }
  //   const res = mockingResponse()
  //   deleteVariants(req,res).then((data) => {
  //     expect(data.json.args[0][0].message).equal('variants has been deleted!')
  //     expect(data.json.args[0][0].success).to.be.true
  //     expect(data.status.args[0][0]).equal(200)
  //     done()
  //   }).catch((err) => {
  //     done(err)
  //   })
  // })
})
