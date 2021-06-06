
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
	
		_id.my_cell = cell_from_pixel(_id.x, _id.y);
		
		// initialize structure
		structure_born(_id);
	
		// initialize morphology
		morphology_born(_id);		
			
		// log parameters	
		log_events_creature_born(_id);
	}
	else {
		
		// something bad happened during birth, creature is dead
		
		_id.structure.is_dead = true;
		_id.structure.dead_cause = DEADCAUSE.BIRTH;		
		log_events_creature_dead(_id);
	}
	
	//  log genome for initial creatures
	if _id.structure.generation == 0 {
		log_events_specie_genome(_id.genome);
		log_event(LOGEVENT.WORLD_INITIAL_GENUS, _id);		
	}
	
	
	_id.state.next_state = STATE.IDLE;
		
}