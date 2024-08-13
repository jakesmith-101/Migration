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
	this.allowedMethods = {};

	/**
	 * Display a listing of the resource
	 */
	function index( event, rc, prc ){
		prc.orders = orderService.getOrders();
		event.renderData( type="json", data=prc.orders );
	}

	/**
	 * view
	 */
	function view( event, rc, prc ){
		prc.order = orderService.retrieveOrderById( rc.id );
		event.renderData( type="json", data=prc.order );
	}

	/**
	 * save
	 */
	function save( event, rc, prc ){
		prc.order = orderService.save( rc );
		event.renderData( type="json", data=prc.order, statusCode=201, statusMessage="We have saved your order" );
	}

	/**
	 * remove
	 */
	function remove( event, rc, prc ){
		prc.order = orderService.remove( rc.id );
		event.renderData( type="json", data=prc.order, statusCode=201, statusMessage="We have deleted your order"  );
	}



}

