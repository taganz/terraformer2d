
if !controller.sim_paused {
	
	// new sim step?
	// producers use larger cycle
	if controller.time.sim_step_entry and is_plant == false 
	|| controller.time.sim_month_entry and is_plant == true {   

		// next action
		state.step();

		if structure.is_dead==false {
			
			// increment age, calculate DEPRECATED_AGE_ADULT
			
			age_growth(id);
			
			// absorb nutrients
		
			if id.is_plant {
				structure_metabolism_plant(id);
			}
			else {
				structure_metabolism_animal(id);
			}
			
			// once biomass is updated, reallocate it among biomass_eat, biomass_body and biomass_reproduction
			
			biomass_allocation(id);

		}

		// update morphology parameters if necessary
		morphology.step();		
	}

}

	
// === depth for drawing		

switch(genome[GEN.TROPHIC_LEVEL]) {
	case TROPHIC_LEVEL.PRODUCER:	depth = -LAYER_BASE_PRODUCER - y;	break;
	case TROPHIC_LEVEL.PRIMARY:		depth = -LAYER_BASE_PRIMARY - y;	break;
	case TROPHIC_LEVEL.SECONDARY:	depth = -LAYER_BASE_SECONDARY -y;	break;
}
