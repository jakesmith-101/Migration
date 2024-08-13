/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.RestHandler"{

	this.allowedMethods = {
		"index"  : "GET",
		"view"   : "GET",
		"save"   : "POST,PUT,PATCH",
		"remove" : "DELETE"
	};

	property name="orderService" inject="OrderService";

	/**
	 * Display a listing of orders
	 */
	function index( event, rc, prc ){
		return orderService.getOrders();
	}

	/**
	 * view an order
	 */
	function view( event, rc, prc ){
		return orderService.retrieveOrderById( rc.orderID );
	}

	/**
	 * save an order
	 */
	function save( event, rc, prc ){
		return orderService.updateOrder( rc.items, rc.orderID );
	}

	/**
	 * remove an order
	 */
	function remove( event, rc, prc ){
		return orderService.removeOrder( rc.orderID );
	}



}

