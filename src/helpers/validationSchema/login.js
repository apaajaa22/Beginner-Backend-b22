module.exports = {
  email: {
    isEmail: {
      bail: true,
      errorMessage: 'email is required'
    }
  },
  password: {
    isLength: {
      errorMessage: 'password length must be 7 characters at least',
      options: {
        min: 6
      }
    }
  }
}
