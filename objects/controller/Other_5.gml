
// === close log file

if room != Room0 {
	log_close();
}


// === prepare next room

if room == Room0 {
	
	
	
	room_set_width(obj_gui.selected_room, game_max_x);
	room_set_height(obj_gui.selected_room, game_max_y);
	
	sim_paused = false;
	global.debug = false;
	debug_morphology_creatures_as_dots = false;
	time = new Time();

	world = new World();
	world.temperature_increment = user_options.room_temperature_increment;
	world.radiation = user_options.room_world_radiation;
	// add water
	grid_do_rain();	

	// restart species statistics, initial species definitions
	species = new Species();
	specie_load_sprites();


}