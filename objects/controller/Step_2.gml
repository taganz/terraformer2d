
if room != Room0 {
	
		// === update statistics
		
		if time.sim_step_entry {
			LOG(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.PRODUCER, world.trophic_level_live_now[TROPHIC_LEVEL.PRODUCER]);
			LOG(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.PRIMARY, world.trophic_level_live_now[TROPHIC_LEVEL.PRIMARY]);
			LOG(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.SECONDARY, world.trophic_level_live_now[TROPHIC_LEVEL.SECONDARY]);
		}
	
	 
}
