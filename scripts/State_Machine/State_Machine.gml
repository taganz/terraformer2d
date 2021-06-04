/*
	State_Machine
*/

function State_Machine(_id, _initial_state) constructor {

	previous_state = -1;
	state = -1;
	next_state= _initial_state;
	state_entry = true;
	frames_in_state = -1;
	
	state_script[STATE.BORN] = -1;
	state_script[STATE.IDLE] = -1;
	state_script[STATE.EAT] = -1;
	state_script[STATE.REPRODUCTION] = -1;
	state_script[STATE.DEAD] = -1;

}