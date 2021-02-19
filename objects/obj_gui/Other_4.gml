/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if room == Room0 {
	home_container = gui_define_home_container();
}
else {
	simulation_container = gui_define_simulation_container();
	escape_screen_container = gui_define_escape_screen_container();
}






show_debug_message("obj_gui. starting room:            "+room_get_name(room));
show_debug_message("obj_gui. options_unlimited_water:  "+string(options_unlimited_water));
show_debug_message("obj_gui. options_log:              "+string(options_log));
