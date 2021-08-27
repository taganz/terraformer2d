/// @description Erase screen

if room == Room0 {
}
else if room == Room1 {
	
	with obj_gui.game_gui {
		// simulation area
		draw_set_color(c_olive);
		draw_rectangle(0, 0, game_width-1, game_height -1, false);
	}
}
else {
	
	with obj_gui.game_gui {
		// simulation area
		draw_set_color(c_green);
		draw_rectangle(0, 0, simulation_width -1, simulation_height -1, false);
	
		// zone under simulation
		draw_set_color(c_ltgray);
		draw_rectangle(0, simulation_height, simulation_width - 1, game_height -1, false);

		// control bbar
		draw_set_color(c_ltgray);
		draw_rectangle(simulation_width, 0, game_width - 1, game_height - 1, false);
	}
}