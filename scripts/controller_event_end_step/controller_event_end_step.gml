
function controller_event_end_step(){
	
	with controller {
		
		if sim_active and controller_is_paused()==false {
	
				// if too many live creatures, stop loggin all of them
				if user_options.LOG_CREATURES_ALL {
					if world.creatures_peak > LOG_MAXIMUM_CREATURES_ALL {
						user_options.LOG_CREATURES_ALL = false;
						log_error("Warning: setting LOG_CREATURES_ALL=false. creatures_peak="+string(world.creatures_peak)+ " and LOG_MAXIMUM_CREATURES_ALL="+string(LOG_MAXIMUM_CREATURES_ALL));
					}
				}	
	
				// === update statistics
				if time.sim_month_entry {

					log_step_population();
		
				}
		}

	}
}