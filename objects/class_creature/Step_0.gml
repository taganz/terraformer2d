
if !controller.sim_paused {
	
	// new sim step?
	// producers use larger cycle
	if controller.time.sim_step_entry and is_producer == false 
	|| controller.time.sim_month_entry and is_producer == true {   

		// next action
		state.step();

		if structure.is_dead==false {
			
			// increment age, calculate age_adult
			
			age_growth(id);
			
			// absorb nutrients
		
			structure.do_metabolism();
			
			// once biomass is updated, reallocate it among biomass_eat, biomass_body and biomass_reproduction
			
			biomass_allocation(id);

			// check ready for reproduction
			
			with structure {
				reproduction_is_ready = 
						biomass_reproduction > _biomass_reproduction_max * 0.8
						and age - reproduction_age_last_time > reproduction_interval; 
			}
			
		}

		// update morphology parameters if necessary
		morphology.step();	
	
	}
}