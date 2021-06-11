
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
	world.climate_change_temperature_increment = user_options.room_temperature_increment;
	//world.radiation = room_world_radiation;
	world.radiation = user_options.room_world_radiation;
	// add water
	grid_do_rain();	

	// restart species statistics, initial species definitions
	species = new Species();


}