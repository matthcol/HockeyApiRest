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
	 * @id id of the team to modify
	 * @team object representing team with new values
	 * @return boolean, true if success, false if anything go wrong
	 */
	function modify(required id, required team){
		if (arguments.team.id != arguments.id) {
			// team has an id different from routing id 
			return false;
		}
		local.teams = this.mockTeams
			.filter( function( team ) {
				return arguments.team.getId() == id;
			} )
		if (teams.len() == 0) {
			// no team with this id
			return false;
		}
		// TODO: improve to erase missing data in existing object
		variables.populator.populateFromStruct(target=local.teams[1], memento=arguments.team);
		return true;
	}

	/**
	 * remove
	 * @id id of the team to delete
	 * @return the position of the deleted team, 0 if not found
	 */
	function remove(required id){
		local.index = this.mockTeams
			.find( function( team ) {
				return arguments.team.getId() == id;
			} )
		if (local.index > 0) {
			// no team with this id
			this.mockTeams.deleteAt(local.index);
		}
		return local.index;
	}

}