// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_idle(_id){


	
	var _struct = _id.structure;		//  shorthand
	
	
	// growing?
	if _struct.age_is_adult_reproduction == false {
		// always eating when growing
		_id.state.next_state = STATE.EAT;
	}
	// adult
	// to old?
	else if _struct.is_dead {
			_id.state.next_state = STATE.DEAD;
	}
	// starving? - if starving don't reproduce
	else if _struct.is_starving {
		
		_id.state.next_state = STATE.EAT;
	}
	// time for reproduction? 
	else if _struct.reproduction_is_ready  {
				
		_id.state.next_state = STATE.REPRODUCTION;
	}
	// eat
	else if _struct.is_hungry {
		_id.state.next_state = STATE.EAT;
	}
		
}