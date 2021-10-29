/**
 * I am a new Model Object
 */
component singleton {

	// Properties
	property name="populator" inject="wirebox:populator";

	// mock persistence
	property name="mockTeams";

	/**
	 * Constructor
	 */
	TeamService function init(){
		this.mockTeams = [];
		return this;
	}

	/**
	 * getAll
	 */
	Team[] function getAll(){
		return this.mockTeams;
	}

	/**
	 * getById
	 */
	Team function getById(required id){
		return this.mockTeams
			.filter(function(t){return arguments.t.getId()== id;})
			[1];
	}

	/**
	 * add
	 */
	function add(){

	}

	/**
	 * modify
	 */
	function modify(){

	}

	/**
	 * remove
	 */
	function remove(){

	}


}