
// terminal state

function state_dead(_id){

	// mark creature as dead in world

	if (state_entry) {
		controller.world.creature_dead(_id);
		log_events_creature_dead(_id);
		
	}
	else {
	
		// simulate decomposition
	
		var _decomp = controller.world.biomass_decomposition(_id);
		log_event(LOGEVENT.CREATURE_DECOMPOSE, _id, _decomp);
		
		// when descomposition is finished, remove corps. don't do this at the same step than diying
	
		if (_id.structure.biomass <= BIOMASS_DECOMPOSITION_ZERO) {
			controller.world.creature_remove(_id);		
			log_event(LOGEVENT.CREATURE_DECOMPOSE_COMPLETED, _id);
			instance_destroy(_id);
		}
	}


}