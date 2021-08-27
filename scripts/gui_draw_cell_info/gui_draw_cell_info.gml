// === user pressed key to see world data

function gui_draw_cell_info(){

	
	draw_set_colour(c_black);
	draw_set_valign(fa_top);
	
	if world_is_inside_pixel(mouse_x, mouse_y) {
		
		
		// draw cell info
		
		var x_draw = obj_gui.game_gui.gui_width - 500;
		var y_draw = obj_gui.game_gui.gui_height - 150;
				
		var _txt = 
				"Pixel: "+string(mouse_x)+","+string(mouse_y)
				+" Cell: "+string(grid_pixel_to_cell_x(mouse_x))
						+","+string(grid_pixel_to_cell_y(mouse_y))
				+" " +cell_to_string(cell_from_pixel(mouse_x, mouse_y));
		draw_text(x_draw, y_draw, _txt);
		
		// draw cell rectanble
		
		var _x0 = grid_pixel_x_from_cell_x(grid_pixel_to_cell_x(mouse_x));
		var _y0 = grid_pixel_y_from_cell_y(grid_pixel_to_cell_y(mouse_y));
		draw_rectangle(_x0, _y0, _x0 + controller.world.cell_size_px, _y0 + controller.world.cell_size_px, true );
					
	}

	
}




/*

var x_draw = 10;
		var y_draw = controller.user_options.simulation_height + 100;
				
		draw_text(x_draw, y_draw, string_repeat("                  ", 10));
		draw_text(x_draw, y_draw, "Pixel: "+string(mouse_x)+","+string(mouse_y));
		y_draw +=16;
		
		draw_text(x_draw, y_draw, string_repeat("                  \n", 10));
		draw_text(x_draw, y_draw, "Cell: "+string(grid_pixel_to_cell_x(mouse_x))
						+","+string(grid_pixel_to_cell_y(mouse_y)));
		y_draw +=16;
			
		draw_text(x_draw, y_draw, string_repeat("                  \n", 10));
		draw_text(x_draw, y_draw, +cell_to_string(cell_from_pixel(mouse_x, mouse_y)));
		y_draw +=16;
			
		// draw cell rectanble
		
		var _x0 = grid_pixel_x_from_cell_x(grid_pixel_to_cell_x(mouse_x));
		var _y0 = grid_pixel_y_from_cell_y(grid_pixel_to_cell_y(mouse_y));
		draw_rectangle(_x0, _y0, _x0 + controller.world.cell_size_px, _y0 + controller.world.cell_size_px, true );
					
*/