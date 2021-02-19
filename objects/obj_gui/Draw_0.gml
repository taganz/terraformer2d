

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
		
		// show creature info if necessary
		gui.show_creature_info_screen();
		
		// simulation data on top of screen		
		controller.log.log_screen_world();

	}
	



}