
if room != Room0 and controller.sim_paused == false {
	
		// === update statistics
		
		
		// if too many live creatures, stop loggin all of them
		if user_options.LOG_CREATURES_ALL {
			if world.creatures_peak > LOG_MAXIMUM_CREATURES_ALL {
				user_options.LOG_CREATURES_ALL = false;
				log_error("Warning: setting LOG_CREATURES_ALL=false. creatures_peak="+string(world.creatures_peak)+ " and LOG_MAXIMUM_CREATURES_ALL="+string(LOG_MAXIMUM_CREATURES_ALL));
			}
		}	
		
		//if time.sim_step_entry {
		if time.sim_month_entry {
			log_event(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.PRODUCER, world.trophic_level_live_now[TROPHIC_LEVEL.PRODUCER]);
			log_event(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.PRIMARY, world.trophic_level_live_now[TROPHIC_LEVEL.PRIMARY]);
			log_event(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.SECONDARY, world.trophic_level_live_now[TROPHIC_LEVEL.SECONDARY]);
			log_event(LOGEVENT.WORLD_BIOMASS, 0, TROPHIC_LEVEL.PRODUCER, world.trophic_level_biomass_now[TROPHIC_LEVEL.PRODUCER]);
			log_event(LOGEVENT.WORLD_BIOMASS, 0, TROPHIC_LEVEL.PRIMARY, world.trophic_level_biomass_now[TROPHIC_LEVEL.PRIMARY]);
			log_event(LOGEVENT.WORLD_BIOMASS, 0, TROPHIC_LEVEL.SECONDARY, world.trophic_level_biomass_now[TROPHIC_LEVEL.SECONDARY]);
		}
	
	 
}
