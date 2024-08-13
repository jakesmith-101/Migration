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
        if (orders !== undefined) {
            res.json(orders);
            return;
        } else {
            res.status(404).json(null); // not found
            return;
        }

        res.status(400).json(false); // unuseful error
    },

    // view order
    view: (req, res) => {
        const fOrder = orders.find(o => o.id === req.params.orderID);
        if (fOrder !== undefined) {
            res.json(fOrder);
            return;
        } else {
            res.status(404).json(null); // not found
            return;
        }

        res.status(400).json(false); // unuseful error
    },

    // create or update order
    save: (req, res) => {
        const orderBody = JSON.parse(req.body);
        const items = orderBody?.items ?? [];
        if (req.params.orderID !== undefined) {
            const orderIndex = orders.findIndex(o => o.id === req.params.orderID);
            if (orderIndex !== -1) {
                orders[orderIndex] = { items, id: req.params.orderID };
                res.json(req.params.orderID);
                return;
            } else {
                res.status(404).json(null); // not found
                return;
            }
        } else {
            const id = v4();
            orders.push({ id, items });
            res.json(id);
            return;
        }

        res.status(400).json(false); // unuseful error
    },

    // delete order
    remove: (req, res) => {
        const orderIndex = orders.findIndex(o => o.id === req.params.orderID);
        if (orderIndex !== -1) {
            orders.splice(orderIndex, 1);
            res.json(true);
            return;
        } else {
            res.status(404).json(null);
            return;
        }

        res.status(400).json(false); // unuseful error
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

app.route('/api/order')
    .get(order.index) // order list
    .post(order.save) // create order
    .put(order.save); // create order
app.route('/api/order/:orderID')
    .get(order.view) // view order
    .post(order.save) // edit order
    .put(order.save) // edit order
    .delete(order.remove); // delete order

// listen for requests
app.listen(port, () => {
    console.log(`Example RESTful api listening on port ${port}`)
})