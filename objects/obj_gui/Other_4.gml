/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if room == Room0 {
	container_home= gui_screen_main();
	container_config_room_1= gui_screen_config_level();
}
else {
	show_debug_message("Opening simulation. Selected room: "+ room_get_name(selected_room));
	show_debug_message("Opening simulation. Selected climate: "+ string(controller.user_options.room_climate));
	show_debug_message("Opening simulation. Selected soil: "+ string(controller.user_options.room_soil_type));
	
	// prepare climate replacement
	//controller.user_options.room_climate = selected_climate;
	
	warning_no_creature_alive_issued = false;
	container_simulation = gui_bar_simulation();
	container_escape_screen = gui_screen_escape();
}





