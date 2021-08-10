function controller_is_paused(){
	// can not pause at beginning to allow everything to be initialized
	return controller.sim_paused == true and controller.time.current_sim_step > 1;
}