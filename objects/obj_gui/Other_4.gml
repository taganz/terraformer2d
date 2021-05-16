/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if room == Room0 {
	container_home= gui_define_container_home();
	container_config_room_1= gui_define_container_config_room_1();
}
else {
	show_debug_message("Opening simulation. Selected room: "+ room_get_name(selected_room));
	show_debug_message("Opening simulation. Selected climate: "+ string(controller.user_options.climate_replace));
	show_debug_message("Opening simulation. Selected soil: "+ string(controller.user_options.soil_type_replace));
	
	// prepare climate replacement
	//controller.user_options.climate_replace = selected_climate;
	
	warning_no_creature_alive_issued = false;
	container_simulation = gui_define_container_simulation();
	container_escape_screen = gui_define_container_escape_screen();
}





