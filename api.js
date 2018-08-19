var jsonServer = require('json-server')

// Returns and Express server
var server = jsonServer.create()

// Set default middleware (logger, static, cors and no-cache)
server.use(jsonServer.defaults())

var router = jsonServer.router('db.json')
server.use(router)

console.log('Listening at 4000')
server.listen(4000)

// run server with `node api.js`
