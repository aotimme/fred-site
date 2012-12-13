exports.DB   = 'mongodb://localhost/fred'

if process.env.ENV is 'prod'
  exports.PORT = 3000
else
  exports.PORT = 3005
