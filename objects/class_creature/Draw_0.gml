

// draw creature if not showing gui

if obj_gui.show == false {


	// === draw creature

	if structure.age > 1 
		morphology.draw();

	if creature_log {
		if controller.time.flash_50
			draw_circle_color(x, y, 20, c_red, c_red, true);
	}

	// === show info if necessary

	// - moved to gui - controller.log.show_creature_info_screen(id);
}
