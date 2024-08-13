import express, { RequestHandler } from 'express';
import QueryString from 'qs';

type tHandler = RequestHandler<{}, any, any, QueryString.ParsedQs, Record<string, any>>;

const app = express()
const port = 8888

// storing orders in memory isntead of DB as an example
const orders = [];

const order: { [key: string]: tHandler } = {
    // get order list
    index: (req, res) => {

        res.json();
    },

    // view order
    view: (req, res) => {

        res.json();
    },

    // create or update order
    save: (req, res) => {
        req

        res.json();
    },

    // delete order
    remove: (req, res) => {

        res.json();
    }
}

app.map({
    '/api/order': {
        get: order.index,
        '/:orderID': {
            get: order.view,
            post: order.save,
            put: order.save,
            delete: order.remove
        }
    }
});

// listen for requests
app.listen(port, () => {
    console.log(`Example RESTful api listening on port ${port}`)
})