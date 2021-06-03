
function gui_escape_screen_toggle() {
	
	if 	obj_gui.show_escape_screen {
		
			// OFF
			
			obj_gui.show_escape_screen = false;
			controller.sim_paused = false;
			
			layer_id = layer_get_id("Instances");
			layer_set_visible(layer_id, true);
			layer_id = layer_get_id("tools");
			layer_set_visible(layer_id,obj_gui.layer_cell_tools_visible);
			layer_id = layer_get_id("cell_grid");
			layer_set_visible(layer_id, obj_gui.layer_cell_grid_visible);
			layer_id = layer_get_id(LAYER_CLIMATE);
			layer_set_visible(layer_id, obj_gui.layer_climate_visible);
			layer_id = layer_get_id(LAYER_SOIL);
			layer_set_visible(layer_id, obj_gui.layer_soil_visible);
		}
		else {
			
			// ON
			
			obj_gui.show_escape_screen = true;
			controller.sim_paused = true;
			
			
			layer_id = layer_get_id("Instances");
			layer_set_visible(layer_id, false);
			
			layer_id = layer_get_id("tools");
			obj_gui.layer_cell_tools_visible = layer_get_visible(layer_id);
			layer_set_visible(layer_id, false);
			
			layer_id = layer_get_id("cell_grid");
			obj_gui.layer_cell_grid_visible = layer_get_visible(layer_id);
			layer_set_visible(layer_id, false);
			
			layer_id = layer_get_id(LAYER_CLIMATE);
			obj_gui.layer_climate_visible = layer_get_visible(layer_id);
			layer_set_visible(layer_id, false);
			
			layer_id = layer_get_id(LAYER_SOIL);
			obj_gui.layer_soil_visible = layer_get_visible(layer_id);
			layer_set_visible(layer_id, false);
			
		}

}