

// draw creature if not showing escape screen

if obj_gui.show_escape_screen == false {


	// === draw creature

	if structure.age > 1 
		morphology.draw();

	if creature_log {
		if controller.time.flash_50
			draw_circle_color(x, y, 20, c_red, c_red, true);
	}

}
