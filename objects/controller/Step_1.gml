/// @description World step

if room != Room0 {

	if !controller.sim_paused {

		// update time
		time.step();

		// rain
		//if time.sim_step_entry
		//	&& time.current_sim_step mod SIMULATION_PLANT_CYCLE_SIM_STEPS == 0  {
		if time.sim_month_entry
				world.rain();		
	


		// update statistics
		if time.sim_step_entry {
			statistics.step(time.current_sim_step);
			LOG(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.PRODUCER, world.trophic_level_live_now[TROPHIC_LEVEL.PRODUCER]);
			LOG(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.PRIMARY, world.trophic_level_live_now[TROPHIC_LEVEL.PRIMARY]);
			LOG(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.SECONDARY, world.trophic_level_live_now[TROPHIC_LEVEL.SECONDARY]);
		}
	
		/*
		show_debug_message(string(time.current_step)
				+ " --- sim step: "+ string(time.current_sim_step)
				+ "   change: "+string(time.sim_step_entry)
				+ "   --- month: "+ string(time.current_sim_month)
				+ "   change: "+string(time.sim_month_entry)
				+ "   --- year: "+ string(time.current_sim_year)
				);
		*/
	}
}
	