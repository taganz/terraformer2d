
if !controller.sim_paused {
	
	if controller.time.sim_step_entry and is_plant == false {
			
		if structure.is_dead == false and state.next_state!=STATE.BORN
			brain_step(id);
	
	
		if creature_verbose or DEBUG_VERBOSE_ANIMALS and is_plant == false {
			show_debug_message(
				  string(id)
				+ (is_primary ? " P " : " S ")
				+" "+string(floor(x))+","+string(floor(y))
				+"   threat="+string(brain.seen_threat)	
				+"   food="+string(brain.seen_food)	
				+"   food_dist="+string(floor(brain.seen_food_distance))	
				)
		}		

	
	}
	
	
}
		
		