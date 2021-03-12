

if room != Room0 and show_escape_screen == false {
	gui_text_on_simulation_screen();
	
	if global.debug {
		gui_draw_grid();
	}
}