// see state diagram in state_ENUM
// only animals need to EAT, plants receive water directly from world)
		
function state_idle(_id){

	with _id.structure {
			
		// to old?
		if is_dead {
			_id.state.next_state = STATE.DEAD;
		}
		// time for reproduction? 
		else if reproduction_ready(_id)  {
			
			if _id.is_plant != false {
				var breakpoint_reproduction_animal = true;
			}
				
			_id.state.next_state = STATE.REPRODUCTION;
		}
		// nothing interesting to do for plants
		else if _id.is_plant {
			_id.state.next_state = STATE.IDLE; 
		}
		// animals: if hungry go for food
		else if is_hungry {
			
			if _id.brain.seen_food == noone {
				
				// search food
				brain_wander(_id);
				_id.state.next_state = STATE.IDLE;
			}
			else {
				
				// go to seen food
				_id.state.next_state = STATE.EAT;
			}
		}
		// animals: nothing to do, rest
		else {
			_id.state.next_state = STATE.IDLE;
		}
	}
}