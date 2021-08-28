/// @description Render containers & ...



// --- render gui containers

if room == Room0 {
	// should not be here
}
if room == Room1 {
	
	game_gui.container_main.Render();
	EmuOverlay.Render();
}

else {

	// === escape screen (simulation options)
	if game_gui.show_escape_screen {
		game_gui.container_escape_screen.Render();
		EmuOverlay.Render();
	}
	
	// === simulation screen
	
	else  {
		
		// when drawing viewport 1 render EMU widgews
		
		if view_current == 1 {
			
			// buttons
			game_gui.container_bar_simulation.Render();
			EmuOverlay.Render();	// dialogs
		}
	}
	

}