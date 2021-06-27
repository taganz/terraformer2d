
if !controller.sim_paused {
	
	// new sim step?
	// producers use larger cycle
	if (controller.time.sim_step_entry and is_plant == false 
		|| controller.time.sim_month_entry and is_plant == true)  {
	//and controller.time.current_sim_month > 1 {   
		
		
		if is_secondary {
			var breakpoint = 1;
		}
		
		// next action
		state_step(id);

		//debug
		
		if structure.is_dead==false {
			
			// increment age, calculate DEPRECATED_AGE_ADULT
			
			age_growth(id);
			
			// absorb nutrients
			structure_metabolism(id);

			// once biomass is updated, reallocate it among biomass_eat, biomass_body and biomass_reproduction
			
			biomass_allocation(id);

		}

		// update morphology parameters if necessary
		morphology_step(id);		
	}

}

	
// === depth for drawing		

switch(genome[GEN.TROPHIC_LEVEL]) {
	case TROPHIC_LEVEL.PRODUCER:	depth = -LAYER_BASE_PRODUCER - y;	break;
	case TROPHIC_LEVEL.PRIMARY:		depth = -LAYER_BASE_PRIMARY - y;	break;
	case TROPHIC_LEVEL.SECONDARY:	depth = -LAYER_BASE_SECONDARY -y;	break;
}
