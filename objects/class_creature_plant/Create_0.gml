event_inherited();

structure = new Structure_Plant(id, creature_spawn_as_adult);

morphology = new Morphology_Plant(id);   // will be initialized at state_born
	
state.state_script[STATE.EAT] = -1;    // plants get water from world


