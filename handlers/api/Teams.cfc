/**
 * I am a new handler
 */
component{

	// DI
	property name="teamService" inject="TeamService";

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

	// function onError( event, rc, prc, faultAction, exception, eventArguments ){
	// 	// event.renderData(
	// 	// 	type="JSON", 
	// 	// 	data={
	// 	// 		rc=rc,
	// 	// 		faultAction=faultAction,
	// 	// 		exception=exception,
	// 	// 		eventArguments = eventArguments
	// 	// 	},
	// 	// 	statusCode=401);
	// 	event.renderData(
	// 		type="JSON", 
	// 		data={
	// 			message="Bad Request with these arguments",
	// 			arguments=rc,
	// 			calledFunction=faultAction
	// 		},
	// 		statusCode=418
	// 		//,statusMessage="Je Suis Un Theiere"
	// 		);
	// }

	/**
	 * index
	 */
	function index( event, rc, prc ){
		return teamService.getAll();
	}

	/**
	 * byId
	 */
	function byId( event, rc, prc ){
		local.team =  teamService.getById(rc.teamID);
		if (team.getId() == "") {
			event.renderData(
					type="JSON", 
					data={message: "id not found"}, 
					statusCode=400);
		} else {
			return local.team;
		}
	}

	/**
	 * save
	 */
	function save( event, rc, prc ){
		local.id = teamService.add(rc);
		event.renderData(type="JSON", data=local.id, statusCode=201);
	}

	/**
	 * modify
	 */
	function modify( event, rc, prc ){
		local.ok = teamService.modify(rc.teamID, rc);
		if (ok) {
			event.renderData(type="JSON", data={}, statusCode=200);
		} else {
			event.renderData(
					type="JSON", 
					data={message: "id inconsitent with data or id not found"}, 
					statusCode=400);
		}
		// event.renderData(statusCode=204);
	}

	/**
	 * remove
	 */
	function remove( event, rc, prc ){
		local.index = teamService.remove(rc.teamID);
		//event.renderData(statusCode=204);
		if (local.index > 0) {
			event.renderData(type="JSON", data={}, statusCode=200);
		} else {
			event.renderData(
					type="JSON", 
					data={ message: "no team found with id " & rc.teamID },
					statusCode=400);			
		}
	}

}
