
// === close log file

if room != Room0 {
	log_close();
}


// === prepare next room

if room == Room0 {
	sim_paused = false;
	global.debug = false;
	debug_morphology_creatures_as_dots = false;
	time = new Time();

	world = new World();
	world.climate_change_temperature_increment = user_options.default_climate_change_temperature_increment;
	//world.radiation = default_world_radiation;
	world.radiation = user_options.default_world_radiation;
	// add water
	grid_do_rain();	

	// holds species statistics, initial species definitions
	species = new Species();

	log_open();
	log_events_init_world();

}