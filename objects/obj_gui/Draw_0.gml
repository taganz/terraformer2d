/// @description Render containers & ...

// === main menu screen


if room == Room0 {
	container_main.Render();
	EmuOverlay.Render();
	
}

else {

	// === escape screen (simulation options)
	if show_escape_screen {
		container_escape_screen.Render();
		EmuOverlay.Render();
	}
	
	// === simulation screen
	
	else  {
		
		// erase simulation bar
		//draw_set_color(c_green);
		//draw_rectangle(controller.user_options.room_simulation_width, 0, controller.game_max_x-1, controller.game_max_y-1, false);
		//draw_rectangle(0, 0, controller.game_max_x-1, controller.game_max_y-1, false);
		
	
		
		// show creature info on mouse position
		if input_show_creature_info {
			gui_draw_creature_info();
		}
		
		// show cell info on mouse position
		if input_show_cell_info {
			gui_draw_cell_info();
		}

		// buttons
		container_bar_simulation.Render();
		EmuOverlay.Render();	// dialogs

	}
	



}