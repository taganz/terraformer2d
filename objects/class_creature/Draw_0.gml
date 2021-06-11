

// draw creature if not showing escape screen

if obj_gui.show_escape_screen == false {


	// === draw creature

	if structure.age > 1 {
		if id.is_plant {
			morphology_plant_draw(id);		
		}
		else {
			morphology_animal_draw(id);
		}
	}

	// === debug draw if creature is in log mode

	if creature_log {
		if controller.time.flash_50
		
			// blue circle for me
			
			draw_circle_color(x, y, 20, c_blue, c_blue, true);
			
			// draw cell rectangle for cell
		
			if my_cell != 0 {
				var _x0 = grid_pixel_x_from_cell_x(my_cell.x_cell);
				var _y0 = grid_pixel_y_from_cell_y(my_cell.y_cell);
				draw_rectangle(_x0, _y0, _x0 + CELL_SIZE_PX, _y0 + CELL_SIZE_PX, true );
			}
			
			// draw a red line to last prey eaten and a circle at this prey
			if last_prey_eaten != -1 {
				if instance_exists(last_prey_eaten) {
					draw_line_color(x, y, last_prey_eaten.x, last_prey_eaten.y, c_red, true );
					draw_circle_color(last_prey_eaten.x, last_prey_eaten.y, 40, c_red, c_red, true);
				}
			}
	}

}
