function gui_simulation_quit(){
	
	if show_question("Quit to main menu?") {
		
		// end current simulation
		gui_simulation_end();
		controller_sim_end();
		
		// go to main menu
		room_goto(Room1);  
		
	}
}