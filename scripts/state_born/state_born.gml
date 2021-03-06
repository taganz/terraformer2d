
/*

    state_born

	updates
		world, craature born
		my_cell
		next_state

*/

function state_born(_id){

	
	// can not put this at create event to assure controller has already created world
	controller.world.creature_born(_id, _id.x, _id.y);
	_id.my_cell = controller.world.get_cell(_id.x, _id.y);
	
	// add to species the initial species
	if _id.structure.generation == 1 {
		var prefix = specie_code_prefix(_id.genome);
		controller.species.specie_code_from_new_prefix(prefix, _id);  
	}

	ASSERT(state_entry, _id, "state born reentry? ");
	
	_id.morphology.born();

			
	// log parameters	
	with _id.structure {
		LOG(LOGEVENT.CREATURE_BORN, _id);
		LOG(LOGEVENT.CREATURE_BORN_INFO, _id, "GEN.INITIAL_SPECIE_NAME", string(_id.genome[GEN.INITIAL_SPECIE_NAME]));
		LOG(LOGEVENT.CREATURE_BORN_INFO, _id, "GEN.SPECIE_CODE", string(_id.genome[GEN.SPECIE_CODE]));
		LOG(LOGEVENT.CREATURE_BORN_INFO, _id, "creature_sprite_head", sprite_get_name(_id.creature_sprite_head));
		LOG(LOGEVENT.CREATURE_BORN_INFO, _id, "Climate", climate_to_string(_id.my_cell.climate));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "age", sim_steps_to_years(_id.structure.age));
		//LOG(LOGEVENT.CREATURE_BORN_INFO, _id, "age_adult: "+string(sim_steps_to_years(age_adult))+"y ");
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "age_die", sim_steps_to_years(age_die));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "biomass", units_to_kg(biomass));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "biomass birth", units_to_kg(_id.genome[GEN.BIOMASS_BIRTH]));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "biomass reproduction", units_to_kg(_id.genome[GEN.BIOMASS_REPRODUCTION]));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "biomass adult", units_to_kg(_id.genome[GEN.BIOMASS_ADULT]));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ALLOCATION_REPRODUCTIVE", string(_id.genome[GEN.ALLOCATION_REPRODUCTIVE]));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ALLOCATION_RESERVE", string(_id.genome[GEN.ALLOCATION_RESERVE]));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "generation", generation);
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "_reproduction_interval", sim_steps_to_years(_reproduction_interval));
		LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "_reproduction_distance", _reproduction_distance);
		LOG(LOGEVENT.CREATURE_BORN_INFO, _id, "cell", _id.my_cell.to_string());
	}
	
	
	_id.state.next_state = STATE.IDLE;
		
}