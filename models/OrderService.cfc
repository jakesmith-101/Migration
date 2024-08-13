/**
 * I am a new service
 */
component singleton accessors="true" {

	// Properties
	property name="data" type="array";

	/**
	 * Constructor
	 */
	OrderService function init( ) {
	  variables.data = [
            { "id"=1, "items"=[ "coldbox" ] },
            { "id"=2, "items"=[ "superman" ] },
            { "id"=3, "items"=[ "batman" ] }
          ];
		return this;
	}

	/**
	 * getOrders
	 */
	function getOrders( ) {
		return variables.data;
	}

	/**
	 * retrieveOrderById
	 */
	function retrieveOrderById( required orderID ) {
		arrI = ArrayFindNoCase( variables.data, function( testOrder ) {
			if( testOrder.id == orderID ) return true; return false;
		} );

		if ( arrI != 0 ) {
			return variables.data[ arrI ];
		}
	}

	/**
	 * updateOrder
	 *
	 * broken append, as it does not possibly overwrite previous record
	 */
	function updateOrder( required order ) {
		arrI = ArrayFindNoCase( variables.data, function( testOrder ) {
			if( testOrder.id == orderID ) return true; return false;
		} );

		if ( arrI != 0 ) {
			variables.data[ arrI ] = order;
			return "YES"; /* success */
		} else {
			variables.data.append( order );
			return "YES"; /* success */
		}

		return "NO";
	}

	/**
	 * removeOrder
	 */
	function removeOrder( required orderID ) {
		arrI = ArrayFindNoCase( variables.data, function( testOrder ) {
			if( testOrder.id == orderID ) return true; return false;
		} );

		if ( arrI != 0 ) {
			return ArrayDeleteAt( variables.data, arrI );
		}
		return "NO";
	}


}