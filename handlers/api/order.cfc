/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
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
		event.renderData( type="json", data=prc.orders );
	}

	/**
	 * view an order
	 */
	function view( event, rc, prc ){
		prc.order = orderService.retrieveOrderById( rc.id );
		event.renderData( type="json", data=prc.order );
	}

	/**
	 * save an order
	 */
	function save( event, rc, prc ){
		prc.order = orderService.updateOrder( rc.order );
		event.renderData( type="json", data=prc.order, statusCode=201, statusMessage="We have saved your order" );
	}

	/**
	 * remove an order
	 */
	function remove( event, rc, prc ){
		prc.order = orderService.removeOrder( rc.id );
		event.renderData( type="json", data=prc.order, statusCode=201, statusMessage="We have deleted your order"  );
	}



}

