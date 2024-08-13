import express from 'express';

const app = express()
const port = 8888

// storing orders in memory isntead of DB as an example
const orders = [];

// get order list
function index(req, res) {

    res.json();
}

// view order
function view(req, res) {

    res.json();
}

// create or update order
function save(req, res) {

    res.json();
}

// delete order
function remove(req, res) {

    res.json();
}


app.get('/api/order/', index);
app.route('/api/order/:orderID')
    .get(view)
    .post(save)
    .put(save)
    .delete(remove);

// listen for requests
app.listen(port, () => {
    console.log(`Example RESTful api listening on port ${port}`)
})