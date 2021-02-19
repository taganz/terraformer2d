// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gui_escape_screen_toggle() {
	
	if 	obj_gui.show_escape_screen {
		
			// OFF
			
			obj_gui.show_escape_screen = false;
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
			
			// ON
			
			obj_gui.show_escape_screen = true;
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