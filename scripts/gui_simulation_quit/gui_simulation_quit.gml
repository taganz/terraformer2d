function gui_simulation_quit(){
	if show_question("Quit to main menu?") {
		gui_simulation_end();
		controller_sim_end();
		room_goto(Room1);
		//game_restart();  
	}
}