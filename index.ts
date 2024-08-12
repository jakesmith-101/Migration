import express from 'express';

const app = express()
const port = 8888

app.get('/order/', (req, res) => {
    res.send("Welcome to my orders.")
})

app.get('/order/create', (req, res) => {

})

app.get('/order/delete', (req, res) => {

})

app.get('/order/purchase', (req, res) => {

})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})