
function log_screen_world(){

	// === user pressed key to see world data
	
	
		if keyboard_check(vk_control) {
	
			draw_set_colour(c_red);
			//draw_set_font(fTextDebug);

			if (mouse_x>= 0 && mouse_y >= 0 
				&& mouse_x <controller.world.world_max_x && mouse_y <controller.world.world_max_y) {
					
				var _offset_print_to_left = mouse_x > 300 ? -300 : 0;
				//var _offset_print_to_left = mouse_x < 200 ? +300 : 0;
				var x_draw = mouse_x + _offset_print_to_left;
				var _offset_print_down = mouse_y > 500 ? -300 : 0;
				var y_draw = mouse_y + _offset_print_down;
				
				var _xx = floor(mouse_x/CELL_SIZE);
				var _yy = floor(mouse_y/CELL_SIZE);
				var _cell = controller.world.grid_cells[# _xx, _yy];
				//var climate = ds_grid_get(controller.world.grid_climate, _xx, _yy);
				//var nutrients = ds_grid_get(world.grid_nutrients, _xx, _yy);
				if _cell!=0 {
					draw_text(x_draw, y_draw, "Climate:"+climate_to_string(_cell.climate));
					y_draw+=32;
					draw_text(x_draw, y_draw, "Water:"+string(_cell.available_water));
					y_draw+=32;
					draw_text(x_draw, y_draw, "Water max:"+string(_cell.soil_available_water_max));
					y_draw+=32;
				}
				draw_text(x_draw, y_draw, "Pixels: "+string(mouse_x)+","+string(mouse_y)+" Grid: "+string(_xx)+","+string(_yy));
					y_draw+=32;
				draw_text(x_draw, y_draw, "Cell: "+cell_to_string(mouse_x, mouse_y));
					y_draw+=32;
			
					
			}
		}
	
}