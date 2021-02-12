

// menu screen

if room == Room0 {
	home_container.Render();
	EmuOverlay.Render();
	
}

else {

	if show {
		escape_screen_container.Render();
		EmuOverlay.Render();
	}


	// === show creature info if necessary

	gui.show_creature_info_screen();

}