
/*

    state_born
	- put creature in world
	- assigns my_cell
	- initilize structure
	- initilize morphology
	- if sthing bad happens, DEADCAUSE.BIRTH
	- --> IDLE

	
*/

function state_born(_id){

	if _id==0
		var breakpoint = true;

	// can not put this at create event to assure controller has already created world
	var born_ok = world_creature_born(_id, _id.x, _id.y);
	
	if born_ok {
		
		// get a cell 
		_id.my_cell = cell_from_pixel(_id.x, _id.y);
		if _id.my_cell == -1 {
			ASSERT(false, _id, "state_born debug  my_cell == -1");
			born_ok = false;
		}
	}
	
	if born_ok {
	
		// initialize structure
		born_ok = structure_born(_id);
		
	}
	
	if born_ok {
	
		// initialize morphology
		morphology_born(_id);		
			
		// log parameters	
		log_creature_born(_id);
			
		//  log genome for initial creatures
		if _id.structure.generation == 0 {
			log_events_specie_genome(_id.genome);
			log_event(LOGEVENT.WORLD_INITIAL_GENUS, _id);		
		}
	}
	else {
		
		// something bad happened during birth, creature is dead
		
		_id.structure.is_dead = true;
		_id.structure.dead_cause = DEADCAUSE.BIRTH;		
		//log_creature_dead(_id);
	}

	
	// === transitions
	
	_id.state.next_state = STATE.IDLE;
	
	ASSERT (_id.my_cell != -1, _id, "state born debug my_cell -1");
		
}