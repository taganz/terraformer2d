// Input keys

// instructions in gui_help_keys() 


#macro KEY_ACTIVATE_LOG_CREATURE_IN_SCREEN "3"  // used in Log
//#macro KEYS_TEXT_LINE "ESC: Options P: Pause  R: Restart  1: Faster  2:Slower  3:Follow  4:Debug  "

if room == Room0 {
}
else if room == Room1 {
}
else {

	// === keyboard commands
	
	
	// show creature info

	obj_gui.game_gui.input_show_creature_info = keyboard_check(vk_shift);
	
	// show cell info
	
	obj_gui.game_gui.input_show_cell_info = keyboard_check(vk_control);
	
	// activate escape screen (option)
	
	if keyboard_check(vk_escape) {
		gui_escape_screen_toggle();
	}
	
	// show climates
	
	if keyboard_check(ord("C")) {
		layer_id = layer_get_id(LAYER_CLIMATE);
		layer_set_visible(layer_id, !layer_get_visible(layer_id));
		layer_id = layer_get_id(LAYER_SOIL);
		layer_set_visible(layer_id, !layer_get_visible(layer_id));
	}
	
	// show creatures as dots
	
	if keyboard_check(ord("D")) {
		controller.debug_morphology_creatures_as_dots = !controller.debug_morphology_creatures_as_dots;
	}
	
	// pause toogle
	
	if keyboard_check(ord("P")) {
		controller.sim_paused = !controller.sim_paused;
	}
	
	// restart simulation
	
	if keyboard_check(ord("R")) {
		gui_simulation_quit();
	}
	
	// simulation speed increase / decrease
	
	if keyboard_check(ord("1")) {
		time_sim_faster();
	}
	if keyboard_check(ord("2")) {
		time_sim_slower();
	}
	
	// debug show layers
	
	if keyboard_check(ord("4")) {
		gui_debug_toogle();
	}




}