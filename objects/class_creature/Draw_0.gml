

// draw creature if not showing escape screen

if obj_gui.show_escape_screen == false {


	// === draw creature

	if structure.age > 1 
		morphology.draw();

	// === draw a red circle if creature is in log mode

	if creature_log {
		if controller.time.flash_50
		
			// red circle
			
			draw_circle_color(x, y, 20, c_red, c_red, true);
			
			// draw cell rectanble
		
			if my_cell != 0 {
				var _x0 = grid_pixel_x_from_cell_x(my_cell.x_cell);
				var _y0 = grid_pixel_y_from_cell_y(my_cell.y_cell);
				draw_rectangle(_x0, _y0, _x0 + CELL_SIZE_PX, _y0 + CELL_SIZE_PX, true );
			}
	}

}
