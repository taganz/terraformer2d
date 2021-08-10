function controller_sim_start() {

	with controller {

		
		// === Initialize simulation time
		
		time = new Time();
		
		// === Initialize simulation world
		
		world = new World();
		world.temperature_increment = user_options.room_temperature_increment;
		world.radiation = user_options.room_world_radiation;
		
		// add water
		grid_do_rain();	

		// === Reset species 

		// restart species statistics, initial species definitions
		species = new Species();
		specie_load_sprites();
			
		log_open();
		log_events_init_world();
		
	}
	
	
}