import express from 'express';

const app = express()
const port = 8888

// get order list
app.get('/api/order/', (req, res) => {
    res.send("Welcome to my orders.")
})

// create or update order
function saveOrder(req, res) {

}
app.post('/api/order/:orderID', saveOrder)
app.put('/api/order/:orderID', saveOrder)

// view order
app.get('/api/order/:orderID', (req, res) => {

})

// delete order
app.delete('/api/order/:orderID', (req, res) => {

})

// listen for requests
app.listen(port, () => {
    console.log(`Example RESTful api listening on port ${port}`)
})