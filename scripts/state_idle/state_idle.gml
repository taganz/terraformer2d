// see state diagram in state_ENUM
// only animals need to EAT, plants receive water directly from world)
		
function state_idle(_id){

	with _id.structure {
			
		// to old?
		if is_dead {
			_id.state.next_state = STATE.DEAD;
		}
		// starving? - if starving don't reproduce
		else if is_starving {
		
			_id.state.next_state = _id.is_plant ? STATE.IDLE : STATE.EAT;
		}
		// time for reproduction? 
		else if reproduction_ready(_id)  {
			
			if _id.is_plant != false {
				var breakpoint_reproduction_animal = true;
			}
				
			_id.state.next_state = STATE.REPRODUCTION;
		}
		// eat
		else if is_hungry {
			_id.state.next_state = _id.is_plant ? STATE.IDLE : STATE.EAT;
		}
	}
}