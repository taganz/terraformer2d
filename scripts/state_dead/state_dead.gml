
// terminal state

function state_dead(_id){

	// mark creature as dead in world

	if (state_entry) {
		controller.world.creature_dead(_id);
		// print a report at console
		//LOG_ID(_id, "DEAD - age: "+string(_id.structure.age)+" biomass: "+string(_id.structure.biomass));
		LOG(LOGEVENT.CREATURE_DEAD, _id, _id.structure.dead_cause, "age: "+string(_id.structure.age));
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