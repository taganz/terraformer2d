// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_step(_id){


	if _id.is_secondary 
		var breakpoint1 = 1;
	if _id.is_primary
		var breakpoint2 = 1;
	if _id == -1
		var breakpoint3 = 1;
	
	// execute script for current state

	with _id.state {
	
		
		// exception states
		
		if _id.structure.is_dead {
			next_state = STATE.DEAD;
		}
		else if _id.brain.seen_threat != noone {
			next_state = STATE.ESCAPE;
		}
		else if _id.structure.is_hungry == false and next_state == STATE.EAT {
			// after metabolism the creature is no more hungry
			next_state = STATE.IDLE;
		}
		else if _id.brain.seen_food == noone and next_state == STATE.EAT {
			// all available food has died since last state
			next_state = STATE.IDLE;
		}
		
		
		
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
