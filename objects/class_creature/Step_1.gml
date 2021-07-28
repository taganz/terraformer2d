
if !controller.sim_paused {
	
	if controller.time.sim_step_entry and is_plant == false {
			
		if structure.is_dead == false and state.next_state!=STATE.BORN
			brain_step(id);
	
	
		log_verbose(id,
				+"   threat="+string(brain.seen_threat)	
				+"   food="+string(brain.seen_food)	
				+"   food_dist_m="+string(floor(brain.seen_food_distance_m))	
				);


	
	}
	
	
}
		
		