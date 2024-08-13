/**
 * I am a new service
 */
component singleton accessors="true"{

	// Properties
	property name="data" type="array";

	/**
	 * Constructor
	 */
	ContactService function init(){
	  variables.data = [
            { "id"=1, "items"=["coldbox"] },
            { "id"=2, "items"=["superman"] },
            { "id"=3, "items"=["batman"] }
          ];
		return this;
	}

	/**
	 * getOrders
	 */
	function getOrders(){
		return variables.data;
	}

	/**
	 * retrieveOrderById
	 */
	function retrieveOrderById(){

	}

	/**
	 * updateOrder
	 */
	function updateOrder(){

	}

	/**
	 * removeOrder
	 */
	function removeOrder(){

	}


}