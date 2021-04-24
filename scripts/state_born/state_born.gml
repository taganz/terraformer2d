
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
		
	// initialize structure
	structure_born(_id);
	
	// initialize morphology
	if _id.is_plant {
		morphology_plant_born(_id);		
	}
	else {
		_id.morphology.born();
	}
			
	// log parameters	
	log_events_creature_born(_id);
	
	
	// add to species the initial species
	if _id.structure.generation == 1 {
		var prefix = specie_code_prefix(_id.genome);
		ds_map_add(controller.species._prefixes_map, prefix, 0);
	}
	
	
	_id.state.next_state = STATE.IDLE;
		
}