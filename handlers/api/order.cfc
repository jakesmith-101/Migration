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
		prc.orders = orderService.getOrders();
		event.getResponse().setData( prc.orders );
	}

	/**
	 * view an order
	 */
	function view( event, rc, prc ){
		prc.order = orderService.retrieveOrderById( rc.id );
		event.getResponse().setData( prc.order );
	}

	/**
	 * save an order
	 */
	function save( event, rc, prc ){
		prc.saved = orderService.updateOrder( rc.order );
		event.getResponse().setData( prc.saved );
	}

	/**
	 * remove an order
	 */
	function remove( event, rc, prc ){
		prc.deleted = orderService.removeOrder( rc.id );
		event.getResponse().setData( prc.deleted );
	}



}

