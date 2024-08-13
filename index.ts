import express from 'express';

const app = express()
const port = 8888

// storing orders in memory isntead of DB as an example
const orders = [];

// get order list
app.get('/api/order/', (req, res) => {

    res.json();
})

// create or update order
function saveOrder(req, res) {

    res.json();
}
app.post('/api/order/:orderID', saveOrder)
app.put('/api/order/:orderID', saveOrder)

// view order
app.get('/api/order/:orderID', (req, res) => {

    res.json();
})

// delete order
app.delete('/api/order/:orderID', (req, res) => {

    res.json();
})

// listen for requests
app.listen(port, () => {
    console.log(`Example RESTful api listening on port ${port}`)
})