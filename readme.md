# REST API built by Coldbox

- port 8443 exists

## docker command to run the code, obviously replace 'WORKING_DIRECTORY'
`docker run --name coldbox -p 8080:8080 -v "WORKING_DIRECTORY:/app" ortussolutions/commandbox`

### make api requests to (replace orderid with nothing for all orders, or an actual id)
- localhost:8080/api/order/ORDERID
