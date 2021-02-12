
if !controller.sim_paused {
	
	// new sim step?
	if controller.time.sim_step_entry {

		// next action
		state.step();

		// absorb nutrients
		if structure.is_dead==false {
			structure.do_metabolism();
		}

		// update morphology parameters if necessary
		morphology.step();	
	
		
	}
}