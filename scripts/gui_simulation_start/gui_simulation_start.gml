function gui_simulation_start(_simulation_id){
	controller.user_options.simulation_id = _simulation_id;
	
	// fill room user_options with default values
	gui_simulation_set_options(controller.user_options.simulation_id);
	
	
	// prepare climate replacement
	//controller.user_options.room_climate = selected_climate;			
	show_debug_message("Opening simulation. Selected room: "+ room_get_name(controller.user_options.simulation_room));
	show_debug_message("Opening simulation. Selected climate: "+ string(controller.user_options.room_climate));
	show_debug_message("Opening simulation. Selected soil: "+ string(controller.user_options.room_soil_type));

	room_set_width(controller.user_options.simulation_room, controller.game_max_x);
	room_set_height(controller.user_options.simulation_room, controller.game_max_y);

	//ASSERT(controller.user_options.simulation_room != -1, 0, "obj_gui, room not selected");
	controller_sim_start();
	controller.sim_paused = true;
	global.debug = false;
	controller.debug_morphology_creatures_as_dots = false;
	obj_gui.warning_no_creature_alive_issued = false;
	room_goto(controller.user_options.simulation_room);  
}