// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_idle(_id){


	
	var _struct = _id.structure;		//  shorthand
	
	
	// growing?
		
	if _struct.is_adult_reproduction == false {
		
		// always eating when growing
		_id.state.next_state = STATE.EAT;
		
	}
	// adult
	else {
		
		// to old?
		if _struct.age > _struct.age_die {
			_id.state.next_state = STATE.DEAD;
		}
		// starving? - if starving don't reproduce
		else if _struct.is_starving {
		
			_id.state.next_state = STATE.EAT;
		}
		// time for reproduction? 
		// must be grown enough and time passed since last reproduction
//		else if _struct.is_adult && (_struct.age > (_struct.reproduction_time_first + _struct.age_adult )
//			 && (_struct.age - _struct.age_last_reproduction) > _struct.reproduction_interval) {
		else if _struct.is_prepared_for_reproduction  {
				
			_id.state.next_state = STATE.REPRODUCTION;
		}
		// eat
		else if _struct.is_hungry {
			_id.state.next_state = STATE.EAT;
		}
		
	}
}