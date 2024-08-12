/**
 * My RESTFul Event Handler
 */
component extends="coldbox.system.RestHandler" {

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only      = "";
	this.prehandler_except    = "";
	this.posthandler_only     = "";
	this.posthandler_except   = "";
	this.aroundHandler_only   = "";
	this.aroundHandler_except = "";

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {
		index='GET',
		delete='POST,DELETE',
		create='POST'
	};

	/**
	 * get all orders
	 *
	 * @x        -route          (GET) /api/order
	 * @response -default ~order/index/responses.json##200
	 */
	function index( event, rc, prc ){
		event.getResponse().setData( "Welcome to my orders." );
	}

	/**
	 * delete specified order
	 *
	 * @x        -route          (POST,DELETE) /api/deleteOrder
	 * @response -default ~order/delete/responses.json##200
	 */
	function delete( event, rc, prc ) {

	}

	/**
	 * create an order
	 *
	 * @x        -route          (POST) /api/createOrder
	 * @response -default ~order/create/responses.json##200
	 */
	function create( event, rc, prc ) {

	}


	/**
	 * A secured route that shows you your information
	 *
	 * @x        -route          (GET) /api/whoami
	 * @security bearerAuth,ApiKeyAuth
	 * @response -default ~echo/whoami/responses.json##200
	 * @response -401     ~echo/whoami/responses.json##401
	 */
	function whoami( event, rc, prc ) secured{
		event.getResponse().setData( jwtAuth().getUser().getMemento() );
	}

}
