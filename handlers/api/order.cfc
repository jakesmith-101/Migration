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

	}

	/**
	 * view
	 */
	function view( event, rc, prc ){

	}

	/**
	 * save
	 */
	function save( event, rc, prc ){

	}

	/**
	 * remove
	 */
	function remove( event, rc, prc ){

	}

	/**
	 * purchase
	 */
	function purchase( event, rc, prc ){

	}



}

