// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_step(_id){
	// execute script for current state

	with _id.state {
	
		// check if something bad happened between state execution
		
		if _id.structure.is_dead
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
			script_execute(state_script[state], _id); 
		else 
			{
				ASSERT(true, _id, "state_script[state] != -1 "+string(_id));
				next_state = STATE.IDLE;
			}
			
		state_entry = false;
		frames_in_state++;
	

	}
}
