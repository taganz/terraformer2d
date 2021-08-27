function gui_simulation_restart(){
	if show_question("Reset simulation?") {
		gui_simulation_end();
		controller_sim_end();
		gui_simulation_start();
	}
}