
/*

    state_born

	updates
		world, craature born
		my_cell
		next_state

*/

function state_born(_id){

	
	// can not put this at create event to assure controller has already created world
	var born_ok = world_creature_born(_id, _id.x, _id.y);
	
	if born_ok {
	
		_id.my_cell = cell_from_pixel(_id.x, _id.y);
		
		// initialize structure
		structure_born(_id);

		// update biomass general stats
		//controller.world.trophic_level_biomass_now[_id.genome[GEN.TROPHIC_LEVEL]]+= _id.structure.biomass;

	
		// initialize morphology
		if _id.is_plant {
			morphology_plant_born(_id);		
		}
		else {
			_id.morphology.born();
		}
			
		// log parameters	
		log_events_creature_born(_id);
	}
	else {
		// born dead
		_id.structure.is_dead = true;
		_id.structure.dead_cause = DEADCAUSE.BIRTH;		
		log_events_creature_dead(_id);
	}
	
	//  log genome for initial creatures
	if _id.structure.generation == 1 {
		log_events_specie_genome(_id.genome);
	}
	
	
	_id.state.next_state = STATE.IDLE;
		
}