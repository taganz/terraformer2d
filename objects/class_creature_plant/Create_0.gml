event_inherited();

structure = new Structure_Plant(id, creature_spawn_as_adult);
//sprite_head = creature_sprite_head;
//sprite_body = creature_sprite_body;
morphology = new Morphology_Plant(id);   // will be initialized at state_born
	
state.state_script[STATE.EAT] = -1;    // plants get water from world