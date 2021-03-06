
// terminal state

function state_dead(_id){

	// mark creature as dead in world

	if (state_entry) {
		controller.world.creature_dead(_id);
		// print a report at console
		//LOG_ID(_id, "DEAD - age: "+string(_id.structure.age)+" biomass: "+string(_id.structure.biomass));
		//LOG(LOGEVENT.CREATURE_DEAD, _id);
		LOG(LOGEVENT.CREATURE_DEAD, _id, deadcause_to_string(_id.structure.dead_cause));
		LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "dead_cause", deadcause_to_string(_id.structure.dead_cause));
		//LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "GEN.INITIAL_SPECIE_NAME", string(_id.genome[GEN.INITIAL_SPECIE_NAME]));
		//LOG(LOGEVENT.CREATURE_CREATURE_DEAD_INFOBORN_INFO, _id, "GEN.SPECIE_CODE", _id.genome([GEN.SPECIE_CODE]));
		LOG(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id, "age", sim_steps_to_years(_id.structure.age));
		//LOG(LOGEVENT.CREATURE_BORN_INFO, _id, "age_adult: "+string(sim_steps_to_years(age_adult))+"y ");
		//LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "age_die", string(sim_steps_to_years(age_die))+"y ");
		LOG(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id, "biomass", units_to_kg(_id.structure.biomass));
		//LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "biomass birth", string(units_to_kg(_id.genome[GEN.BIOMASS_BIRTH]))+"kg ");
		//LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "biomass reproduction", string(units_to_kg(_id.genome[GEN.BIOMASS_REPRODUCTION]))+"kg ");
		//LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "biomass adult", string(units_to_kg(_id.genome[GEN.BIOMASS_ADULT]))+"kg ");
		//LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "generation", string(generation));
		//LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "_reproduction_interval", string(sim_steps_to_years(_reproduction_interval))+"y");
		//LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "_reproduction_distance", string(_reproduction_distance));
		LOG(LOGEVENT.CREATURE_DEAD_INFO, _id, "cell", _id.my_cell.to_string());
		
	}
	else {
	
		// simulate decomposition
	
		var _decomp = controller.world.biomass_decomposition(_id);
		LOG(LOGEVENT.CREATURE_DECOMPOSE, _id, _decomp);
		
		// when descomposition is finished, remove corps. don't do this at the same step than diying
	
		if (_id.structure.biomass <= BIOMASS_DECOMPOSITION_ZERO) {
			controller.world.creature_remove(_id);		
			//LOG_ID(_id, "DECOMPOSED - age: "+string(_id.structure.age)+" biomass: "+string(_id.structure.biomass));
			LOG(LOGEVENT.CREATURE_DECOMPOSE_COMPLETED, _id);
			instance_destroy(_id);
		}
	}


}