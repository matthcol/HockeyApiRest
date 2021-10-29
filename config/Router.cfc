component {

	function configure() {
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */
		
		route( "/api/teams/:teamID" )
            .withAction( {
                GET    = 'byId',
                PUT    = 'modify',
                DELETE = 'remove'
            } )
            .toHandler( "api.Teams" );
		route("/api/teams")
			.withAction({
				GET = 'index',
				POST = 'save'
			})
			.toHandler("api.Teams");
		// get("/api/teams", "api.Teams.index");
		// post("/api/teams", "api.Teams.save");

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ) {
			return "Super!";
		} );

		// API Echo
		get( "/api/echo", "Echo.index" );

		// API Authentication Routes
		post( "/api/login", "Auth.login" );
		post( "/api/logout", "Auth.logout" );
		post( "/api/register", "Auth.register" );

		// API Secured Routes
		get( "/api/whoami", "Echo.whoami" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
