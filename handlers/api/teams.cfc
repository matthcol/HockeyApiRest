/**
 * I am a new handler
 */
component{

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	/**
	 * index
	 */
	function index( event, rc, prc ){
		//return "All teams here";
		return [
			{
			teamId = 2,
			name = "Les Canadiens" 
			},
			{
			teamId = 1,
			name = "New Jersey Devils" 
			},
		];
	}

	/**
	 * view
	 */
	function view( event, rc, prc ){
		// return "One team";
		return {
			teamId = rc.teamID,
			year = rc.year,
			name = "Les Canadiens" 
			};
	}

	/**
	 * save
	 */
	function save( event, rc, prc ){
		// return "save team";
		// event.renderData(formats="json,xml,html", data="save team")
		// event.renderData( type="JSON", data={}, statusCode=404, statusMessage="Team not found");
		// event.renderData( type="JSON", data={teamID=33}, statusCode=201, statusMessage="We have created your team");
		return { team = rc.team, year = rc.year };
	}

	/**
	 * remove
	 */
	function remove( event, rc, prc ){
		//return "remove team";
		event.renderData(type="json", data="remove team")
	}



}
