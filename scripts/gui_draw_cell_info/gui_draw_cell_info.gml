// === user pressed key to see world data

function gui_draw_cell_info(){

	
	draw_set_colour(c_black);
	draw_set_valign(fa_top);
	
	if world_is_inside_pixel(mouse_x, mouse_y) {
		
		
		// draw cell info
		
		var x_draw = 50;
		var y_draw = 300;
				
		
		draw_text(x_draw, y_draw, "Pixel: "+string(mouse_x)+","+string(mouse_y));
		y_draw +=16;
		
		draw_text(x_draw, y_draw, "Cell: "+string(grid_pixel_to_cell_x(mouse_x))
						+","+string(grid_pixel_to_cell_y(mouse_y)));
		y_draw +=16;
			
		draw_text(x_draw, y_draw, +cell_to_string(cell_from_pixel(mouse_x, mouse_y)));
		y_draw +=16;
			
		// draw cell rectanble
		
		var _x0 = grid_pixel_x_from_cell_x(grid_pixel_to_cell_x(mouse_x));
		var _y0 = grid_pixel_y_from_cell_y(grid_pixel_to_cell_y(mouse_y));
		draw_rectangle(_x0, _y0, _x0 + CELL_SIZE_PX, _y0 + CELL_SIZE_PX, true );
					
	}

	
}