/*

	State_Machine

*/



function State_Machine(_id, _initial_state) constructor {

	previous_state = -1;
	state = -1;
	next_state= _initial_state;
	state_entry = true;
	frames_in_state = -1;
	//my_id = _id;
	
	state_script[STATE.BORN] = -1;
	state_script[STATE.IDLE] = -1;
	state_script[STATE.EAT] = -1;
	state_script[STATE.REPRODUCTION] = -1;
	state_script[STATE.DEAD] = -1;


/*
	// execute script for current state

	step = function () {
		
		// check if something bad happened between state execution
		
		if my_id.structure.is_dead
			next_state = STATE.DEAD;
		
		
		// check for state change		

		if (state!=next_state) {
			previous_state = state;
			state = next_state;
			state_entry = true;
			frames_in_state = 0;
		}
		
		// execute script

		if state_script[state] != -1
			script_execute(state_script[state], my_id); 
		else 
			{
				ASSERT(true, my_id, "state_script[state] != -1 "+string(my_id));
				next_state = STATE.IDLE;
			}
			
		state_entry = false;
		frames_in_state++;
	

	}
	*/
	
	/*
	to_string = function() {
		var _t = "";
		switch(state) {
			case STATE.BORN:	_t = "BORN"; break;
			case STATE.IDLE:	_t = "."; break;
			case STATE.EAT:		_t = "EAT"; break;
			case STATE.REPRODUCTION: _t = "REPRODUCTION"; break;
			case STATE.DEAD:	_t = "DEAD"; break;
			default:			_t = "STATE ???"; break;
		}
		return _t;
	}
	
	*/
}