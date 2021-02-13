/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

#macro KEY_ACTIVATE_LOG_CREATURE_IN_SCREEN "3"  // used in Log
#macro KEYS_TEXT_LINE "Q: GUI P: Pause  R: Restart  1: Faster  2:Slower  3:Follow  4:Debug  5:Next room "

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
		if show_question("Restart simulation?")
			game_restart();
	}



	// activate GUI
	if keyboard_check(ord("Q")) {
		if 	show {
			show = false;
			controller.sim_paused = false;
			layer_id = layer_get_id("Instances");
			layer_set_visible(layer_id, true);
			layer_id = layer_get_id("tools");
			layer_set_visible(layer_id, global.debug);
			layer_id = layer_get_id("cell_grid");
			layer_set_visible(layer_id, global.debug);
			layer_id = layer_get_id(LAYER_CLIMATE);
			layer_set_visible(layer_id, global.debug);
			layer_id = layer_get_id(LAYER_NUTRIENTS);
			layer_set_visible(layer_id, global.debug);
		}
		else {
			show = true;
			controller.sim_paused = true;
			layer_id = layer_get_id("Instances");
			layer_set_visible(layer_id, false);
			layer_id = layer_get_id("tools");
			layer_set_visible(layer_id, false);
			layer_id = layer_get_id("cell_grid");
			layer_set_visible(layer_id, false);
			layer_id = layer_get_id(LAYER_CLIMATE);
			layer_set_visible(layer_id, false);
			layer_id = layer_get_id(LAYER_NUTRIENTS);
			layer_set_visible(layer_id, false);
		}
	}



	// simulation speed decrease
	if keyboard_check(ord("2")) 
		controller.time.sim_speed_slower();
	
	// debug show layers
	if keyboard_check(ord("4")) {
		global.debug = !global.debug;
		layer_id = layer_get_id("tools");
		layer_set_visible(layer_id, global.debug);
		layer_id = layer_get_id("cell_grid");
		layer_set_visible(layer_id, global.debug);
		layer_id = layer_get_id(LAYER_CLIMATE);
		layer_set_visible(layer_id, global.debug);
		layer_id = layer_get_id(LAYER_NUTRIENTS);
		layer_set_visible(layer_id, global.debug);
	}

	// next room
	if keyboard_check(ord("5")) {
		if room_next(room) != -1
	    {
			room_goto_next();
	    }
	}

}