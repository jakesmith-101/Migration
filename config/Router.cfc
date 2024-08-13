/**
 * This is your application router.  From here you can controll all the incoming routes to your application.
 *
 * https://coldbox.ortusbooks.com/the-basics/routing
 */
component {

	function configure(){
        setFullRewrites( true );

        // Order Resource
        route( "/api/order/:orderID" )
            .withAction( {
                GET    = 'view',
                POST   = 'save',
                PUT    = 'save',
                DELETE = 'remove'
            } )
            .toHandler( "api.order" );

        route( ":handler/:action?" ).end();
	}

}
