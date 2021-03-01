
if !controller.sim_paused {
	
	// new sim step?
	if controller.time.sim_step_entry and is_producer == false 
	|| controller.time.sim_month_entry and is_producer == true {

		// next action
		state.step();

		if structure.is_dead==false {
			
			// increment age, calculate age_adult
			
			age_growth(id);
			
			// absorb nutrients
		
			structure.do_metabolism();
			
		}

		// update morphology parameters if necessary
		morphology.step();	
	
	}
}