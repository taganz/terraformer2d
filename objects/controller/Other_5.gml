
// === close log file

if room != Room0 {
	log.log_close();
}


// === prepare next room

if room == Room0 {
	sim_paused = false;
	global.debug = false;
	time = new Time();

	world = new World();
	world.climate_change_temperature_increment = default_climate_change_temperature_increment;
	world.radiation = default_world_radiation;

	// holds species statistics, initial species definitions
	species = new Species();

	
	log.log_open();

}