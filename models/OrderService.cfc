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
		arrayIndex = ArrayFind(variables.data, function(s){ 
			return s.id == orderID; 
		});

		if ( arrayIndex != 0 ) {
			return variables.data[ arrayIndex ];
		} else {
			return arrayIndex;
		}

		return "NO";
	}

	/**
	 * updateOrder
	 *
	 * broken append, as it does not possibly overwrite previous record
	 */
	function updateOrder( required order ) {
		arrayIndex = ArrayFind(variables.data, function(s){ 
			return s.id == orderID; 
		});

		if ( arrayIndex != 0 ) {
			variables.data[ arrayIndex ] = order;
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
		arrayIndex = ArrayFind(variables.data, function(s){ 
			return s.id == orderID; 
		});

		if ( arrayIndex != 0 ) {
			return ArrayDeleteAt( variables.data, arrayIndex );
		}
		return "NO";
	}


}