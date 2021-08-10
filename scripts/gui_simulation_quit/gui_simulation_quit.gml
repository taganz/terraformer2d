function gui_simulation_quit(){
	if show_question("Quit to main menu?") {
		controller_sim_end();
		game_restart();  
	}
}