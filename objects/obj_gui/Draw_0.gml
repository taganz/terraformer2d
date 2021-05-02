

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
		
		// buttons
		container_simulation.Render();
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