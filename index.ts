import express, { RequestHandler } from 'express';
import createHttpError from 'http-errors';
import { v4 } from 'uuid';
import QueryString from 'qs';

type tHandler<T> = RequestHandler<T, any, any, QueryString.ParsedQs, Record<string, any>>;

const app = express()
const port = 8888

// storing orders in memory isntead of DB as an example
const orders: { id: string, items: string[] }[] = [];

const order: { [key: string]: tHandler<{ orderID?: string }> } = {
    // get order list
    index: (req, res) => {
        if (orders !== undefined)
            res.json(orders);
        else
            res.status(404).json(null);
    },

    // view order
    view: (req, res) => {
        const fOrder = orders.find(o => o.id === req.params.orderID);
        if (fOrder !== undefined)
            res.json(fOrder);
        else
            res.status(404).json(null);
    },

    // create or update order
    save: (req, res) => {
        const orderBody = JSON.parse(req.body);
        if (req.params.orderID !== undefined) {
            const orderIndex = orders.findIndex(o => o.id === req.params.orderID);

        } else {
            const id = v4();
        }
        res.status(400).json(false);
    },

    // delete order
    remove: (req, res) => {

        res.json();
    }
}

app.param('orderID', function (req, res, next, id) {
    req.params['orderID'] = id;
    if (typeof req.params['orderID'] !== 'string') {
        next(createHttpError(400, 'failed to parseString ' + id));
    } else {
        next();
    }
});

app.map({
    '/api/order': {
        get: order.index, // order list
        post: order.save, // create order
        put: order.save, // create order
        '/:orderID': {
            get: order.view, // view order
            post: order.save, // edit order
            put: order.save, // edit order
            delete: order.remove // delete order
        }
    }
});

// listen for requests
app.listen(port, () => {
    console.log(`Example RESTful api listening on port ${port}`)
})