/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if room == Room0 {
	home_container = gui_define_home_container();
}
else {
	warning_no_creature_alive_issued = false;
	simulation_container = gui_define_simulation_container();
	escape_screen_container = gui_define_escape_screen_container();
}






show_debug_message("obj_gui. starting room:            "+room_get_name(room));
show_debug_message("obj_gui. options_unlimited_water:  "+string(options_unlimited_water));
show_debug_message("obj_gui. options_log:              "+string(options_log));

LOG(LOGEVENT.SIMULATION_PARAMETERS, "starting room:            "+room_get_name(room));
LOG(LOGEVENT.SIMULATION_PARAMETERS, "options_unlimited_water:  "+string(options_unlimited_water));
LOG(LOGEVENT.SIMULATION_PARAMETERS, "options_log:              "+string(options_log));
