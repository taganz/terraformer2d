function gui_simulation_restart(){
	if show_question("Reset simulation?") {
		controller_sim_end();
		gui_simulation_start();
	}
}