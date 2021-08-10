
// first step: birth

if structure.age == -1 {
	creature_born(id);	
}

// brain detects world activity

if !controller_is_paused() {
	
	if controller.time.sim_step_entry and is_plant == false {
			
		if structure.is_dead == false {
			brain_step(id);
			log_verbose(id,
					+"   threat="+string(brain.seen_threat)	
					+"   food="+string(brain.seen_food)	
					+"   food_dist_m="+string(floor(brain.seen_food_distance_m))	
					);
		
		}
	
	}
	
	
}
		
		