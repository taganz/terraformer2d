function gui_simulation_restart(){
	
	if show_question("Reset simulation?") {
		
		// end current simulation
		gui_simulation_end();
		controller_sim_end();
		
		// restart simulation
		gui_simulation_start(controller.user_options.simulation_id);
		
		
	}
}