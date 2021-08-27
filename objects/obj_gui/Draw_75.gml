/// @description Draw text on sim screen

// -- debug: show mouse position

draw_set_colour(c_red);
draw_set_valign(fa_top);
draw_text(0, 100, "Room: "+string(mouse_x)+","+string(mouse_y));
draw_text(0, 120, "GUI:  "+string(device_mouse_x_to_gui(0))+","+string(device_mouse_y_to_gui(0)));

switch(room) {
	case Room0:
		break;
	case Room1: 	
		break;
	default:
	
		// --- simulation screen
		
		if obj_gui.game_gui.show_escape_screen == false {
	
	
			// info on screen
			gui_text_on_simulation_screen();
	
			// grid if debugging
			if global.debug {
				gui_draw_grid();
			}
	
			// show creature info on mouse position
			if obj_gui.game_gui.input_show_creature_info {
				gui_draw_creature_info();
			}
		
			// show cell info on mouse position
			if obj_gui.game_gui.input_show_cell_info {
				gui_draw_cell_info();
			}

		}
}