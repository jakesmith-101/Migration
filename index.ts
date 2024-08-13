import express from 'express';

const app = express()
const port = 8888

// get order list
app.get('/order/', (req, res) => {
    res.send("Welcome to my orders.")
})

// create or update order
function saveOrder(req, res) {

}
app.post('/order/:orderID', saveOrder)
app.put('/order/:orderID', saveOrder)

// view order
app.get('/order/:orderID', (req, res) => {

})

// delete order
app.delete('/order/:orderID', (req, res) => {

})

// listen for requests
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})