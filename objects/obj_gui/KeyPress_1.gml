/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#macro KEY_ACTIVATE_LOG_CREATURE_IN_SCREEN "3"  // used in Log
#macro KEYS_TEXT_LINE "ESC: Options P: Pause  R: Restart  1: Faster  2:Slower  3:Follow  4:Debug  "

if room!= Room0 {

	// pause toogle
	if keyboard_check(ord("P")) {
		controller.sim_paused = !controller.sim_paused;
	}
	
	// simulation speed increase
	if keyboard_check(ord("1")) {
		controller.time.sim_speed_faster();
	}
	
	

	// restart
	if keyboard_check(ord("R")) {
		gui_game_restart();
	}



	// activate escape screen (option)
	if keyboard_check(vk_escape) {
		gui_escape_screen_toggle();
	}



	// simulation speed decrease
	if keyboard_check(ord("2")) 
		controller.time.sim_speed_slower();
	
	// debug show layers
	if keyboard_check(ord("4")) {
		gui_debug_toogle();
	}

	/*
	// next room
	if keyboard_check(ord("5")) {
		if room_next(room) != -1
	    {
			room_goto_next();
	    }
	}
	*/

}