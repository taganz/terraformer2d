

// === main menu screen

if room == Room0 {
	home_container.Render();
	EmuOverlay.Render();
	
}

else {

	// === escape screen (simulation options)
	if show_escape_screen {
		escape_screen_container.Render();
		EmuOverlay.Render();
	}
	
	// === simulation screen
	
	else  {
		
		// buttons
		simulation_container.Render();
		EmuOverlay.Render();		
		
		// show creature info 
		if keyboard_check(vk_shift) {
			gui_draw_creature_info();
		}
		
		// show cell info
		if keyboard_check(vk_control) {
			gui_draw_cell_info();
		}

	}
	



}