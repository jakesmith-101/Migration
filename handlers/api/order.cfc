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
		event.renderData( data=prc.orders, formats="json" );
	}

	/**
	 * view
	 */
	function view( event, rc, prc ){
		prc.order = orderService.getOrder( rc.id );
		event.renderData( data=prc.order, formats="json" );
	}

	/**
	 * save
	 */
	function save( event, rc, prc ){
		prc.order = orderService.setOrder( rc.id );
		event.renderData( data=prc.order, formats="json" );
	}

	/**
	 * remove
	 */
	function remove( event, rc, prc ){
		prc.order = orderService.deleteOrder( rc.id );
		event.renderData( data=prc.order, formats="json" );
	}



}

