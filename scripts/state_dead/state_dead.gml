
// terminal state

function state_dead(_id){

	// mark creature as dead in world

	if (state_entry) {
		log_creature_dead(_id);
		// world_creature_dead(_id);


		// if dead at birth, don't need to decompose
		
		if _id.structure.dead_cause == DEADCAUSE.BIRTH {
			world_creature_remove(_id);		
			instance_destroy(_id);
		}
		else {
			world_creature_dead(_id);

		}
	
	}
	else {
	
		// simulate decomposition
	
		// calculate how much biomass is about to be decomposed
		var _decomp = _id.structure.biomass * BIOMASS_DECOMPOSITION_FACTOR / _id.structure._metabolism_steps_per_month;
		if (_id.structure.biomass - _decomp < BIOMASS_DECOMPOSITION_ZERO)    // too small, go to zero
			_decomp = _id.structure.biomass;
				
		biomass_modify(_id, -_decomp);
		
			
		// transform this biomass into organic nutrients
		//grid_cells[# _id.x div CELL_SIZE_PX, _id.y div CELL_SIZE_PX].map_nutrients[? NUTRIENT.MINERAL] += _decomp;
		
		log_event(LOGEVENT.CREATURE_DECOMPOSE, _id, _decomp);
		
		// when descomposition is finished, remove corps. don't do this at the same step than diying
	
		if (_id.structure.biomass <= BIOMASS_DECOMPOSITION_ZERO) {
			world_creature_remove(_id);		
			log_event(LOGEVENT.CREATURE_DECOMPOSE_COMPLETED, _id);
			instance_destroy(_id);
		}
	}


}