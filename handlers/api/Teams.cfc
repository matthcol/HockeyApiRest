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
		return "all teams";
	}

	/**
	 * byId
	 */
	function byId( event, rc, prc ){
		// try {
			param rc.lang = "";
			// param rc.active = true;
			//param required rc.active boolean;
			param rc.active  = true boolean;
			//cfparam(name="rc.active", default=true, type="boolean");
			// writeDump(event);
			//writeDump(GetHttpRequestData());
			// log.info("get teamby id" & rc.teamID);
			// return { 
			// 	id = rc.teamID,
			// 	name = "Les Canadiens",
			// 	lang =rc.lang,
			// 	active=rc.active,
			// 	rc=rc
			// };
			event.renderData(
				data={ 
					id = rc.teamID,
					name = "Les Canadiens",
					lang =rc.lang,
					active=rc.active,
					rc=rc
				},
				// type="xml"		// handlerimpose le converter
				formats="xml,json"  // laisse le choix au client (header Accept)
				);
		// } catch (any e) {
		// 	event.renderData(
		// 			type="JSON", 
		// 			data={
		// 				message="Bad Request : get team by id with these arguments",
		// 				arguments=rc
		// 			},
		// 			statusCode=400
		// 	);
		// }
	}

	/**
	 * save
	 */
	function save( event, rc, prc ){
		// writeDump(event);
		// return { 
		// 	message: "save new team",
		// 	// name: rc.name,
		// 	rc=rc
		// };
		event.renderData(type="JSON", data={ id=10000}, statusCode=201);
	}

	/**
	 * modify
	 */
	function modify( event, rc, prc ){
		return "modify team";
	}

	/**
	 * remove
	 */
	function remove( event, rc, prc ){
		event.renderData(type="JSON",data="delete team");
	}



}
