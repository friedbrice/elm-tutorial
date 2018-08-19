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

// make a GET request against a resource to query that resource
// make a DELETE request against a resource to delete that resource
// make a PUT request against a resource to replace that resource
// make a PATCH request against a resource to update that resource
// make a POST request against a resource to create a new child resource
