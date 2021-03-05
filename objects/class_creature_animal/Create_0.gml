event_inherited();

structure = new Structure_Animal(id, creature_spawn_as_adult);
morphology = new Morphology(id);
	
state.state_script[STATE.EAT] = state_eat_primary;


