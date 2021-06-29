

// === main menu screen


if room == Room0 {

	// states 0: selecting room, 1: configuring, 2: ready to do next_roomm
	switch(state) {
		case 0:
			container_home.Render();
			EmuOverlay.Render();
			break;
		case 1:
			container_config_room_1.Render();
			EmuOverlay.Render();
			break;
			// room selected show 
		break;
		case 2:
		break;
		default:
			ASSERT(false, 0, "obj_gui, switch state error"+string(state));
	}

	
}

if room == Room0 {

	
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
		
		// buttons
		container_bar_simulation.Render();
		EmuOverlay.Render();		
		
		// show creature info on mouse position
		if input_show_creature_info {
			gui_draw_creature_info();
		}
		
		// show cell info on mouse position
		if input_show_cell_info {
			gui_draw_cell_info();
		}

	}
	



}