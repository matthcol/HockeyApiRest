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
		local.team = new Team();
		local.team.setId(1);
		local.team.setName("Avalanche du Colorado");
		this.mockTeams = [ local.team ];
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
		local.res = this.mockTeams
			.filter(function(t){return arguments.t.getId()== id;});
		if (arrayLen(local.res)) return local.res[1];
		else {
			local.noTeam = new Team();
			return local.noTeam;
		}
	}

	/**
	 * add
	 * @team struct containg all necessary data
	 */
	uuid function add(required team){
		local.newTeam = new Team();
		variables.populator.populateFromStruct(target=local.newTeam, memento=arguments.team);
		local.newTeam.setId(createUUID());
		this.mockTeams.append(local.newTeam);
		return local.newTeam.getId();
	}

	/**
	 * modify
	 */
	function modify(required id, required team){

	}

	/**
	 * remove
	 */
	function remove(required id){

	}


}