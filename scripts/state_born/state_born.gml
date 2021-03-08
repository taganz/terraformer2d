
/*

    state_born

	updates
		world, craature born
		my_cell
		next_state

*/

function state_born(_id){

	
	// can not put this at create event to assure controller has already created world
	world_creature_born(_id, _id.x, _id.y);
	_id.my_cell = cell_from_pixel(_id.x, _id.y);
	
	// add to species the initial species
	if _id.structure.generation == 1 {
		var prefix = specie_code_prefix(_id.genome);
		//controller.species.specie_code_from_new_prefix(prefix, _id);  
		specie_code_from_new_prefix(prefix, _id);  
	}
	
	_id.morphology.born();
			
	// log parameters	
	log_events_creature_born(_id);
	
	
	_id.state.next_state = STATE.IDLE;
		
}