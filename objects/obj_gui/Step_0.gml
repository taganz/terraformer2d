/// @description Detect no creatures


// === Room 0 - screen setup

if room == Room0 {
	
	// Room0 is used only to initialize GUI and change windows size
	room_goto(Room1);
}

// === Room 1 - menu

else if room == Room1 {

	with obj_gui.game_gui {
		
		// detect user simulation selection
		
		if simulation_selected > 0 {
				gui_simulation_start(simulation_selected);

		}
	}
}

// === SIMULATION rooms

else if game_gui.show_escape_screen == false 
	and controller.time.current_sim_step > 50 {
	
	gui_step_check_someone_alive();
}







