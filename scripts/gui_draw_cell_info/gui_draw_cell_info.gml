// === user pressed key to see world data

function gui_draw_cell_info(){

	
	draw_set_colour(c_black);
	
	if world_is_inside_pixel(mouse_x, mouse_y) {
		
		var x_draw = 50;
		var y_draw = 400;
		
		var _cell = cell_from_pixel(mouse_x, mouse_y);
		
		
		draw_text(x_draw, y_draw, "Pixels: "+string(mouse_x)+","+string(mouse_y));
		y_draw+=32;
			
		draw_text(x_draw, y_draw, "Cell: "+cell_to_string(_cell));
		y_draw+=32;
			
					
	}

	
}