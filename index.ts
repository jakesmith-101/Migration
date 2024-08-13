import express, { RequestHandler } from 'express';
import QueryString from 'qs';

type tHandler = RequestHandler<{}, any, any, QueryString.ParsedQs, Record<string, any>>;

const app = express()
const port = 8888

// storing orders in memory isntead of DB as an example
const orders = [];

// get order list
const index: tHandler = (req, res) => {

    res.json();
}

// view order
const view: tHandler = (req, res) => {

    res.json();
}

// create or update order
const save: tHandler = (req, res) => {

    res.json();
}

// delete order
const remove: tHandler = (req, res) => {

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