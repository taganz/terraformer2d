function creature_born(_id){

	if _id==0
		var breakpoint = true;

	// can not put this at create event to assure controller has already created world
	var born_ok = world_creature_born(_id, _id.x, _id.y);
	
	
	// === get a cell
	
	if born_ok {
		_id.my_cell = cell_from_pixel(_id.x, _id.y);
		if _id.my_cell == -1 {
			ASSERT(false, _id, "state_born debug  my_cell == -1");
			born_ok = false;
		}
	}
	
	// === initialize morphology and structure
	
	if born_ok {	
		morphology_born(_id);
		born_ok = structure_born(_id);
	}
	
	
	// === log 
	
	if born_ok {
		
		// log parameters	
		log_creature_born(_id);
			
		//  log genome for initial creatures
		if _id.structure.generation == 0 {
			log_events_specie_genome(_id.genome);
			log_event(LOGEVENT.WORLD_INITIAL_GENUS, _id);		
		}
	}
	
	// === if something bad happened during birth, creature is dead
	
	if born_ok == false {		
		_id.structure.is_dead = true;
		_id.structure.dead_cause = DEADCAUSE.BIRTH;		

	}

		
		
}