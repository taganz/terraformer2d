/*

 called by state_born
 initialize structure vars

	RETURN
		is_dead, dead_cause: if something goes wrong, creature died at birth
		...


*/


function structure_born(my_id){

	with my_id.structure {


		age_die = years_to_sim_steps(my_id.genome[GEN.AGE_DEAD])*random_range(0.9, 1.5);		


		// -- biomass
	
		biomass = (my_id.genome[GEN.BIOMASS_BIRTH]);
		biomass_adult = (my_id.genome[GEN.BIOMASS_ADULT]);
	
		// give some biomass by default for 1st generation creatures.
		// parent will update with real value in step_reproduction() for next generations
	
		if 	age_is_adult or (generation==1 and GENUSS_SPAWN_AS_ADULTS) {
			biomass = biomass_adult;
			age_is_adult = true;
		}

		// 
		_biomass_max = biomass;
		_biomass_reproduction_max = biomass_adult * my_id.genome[GEN.ALLOCATION_REPRODUCTIVE]; 

		
		// reserve
		_biomass_reserve_max = _biomass_max * my_id.genome[GEN.ALLOCATION_RESERVE];
		biomass_reserve = biomass - (_biomass_max - _biomass_reserve_max);
		

		// anabolism is affected by a temperature coefficient

		_Topt2 = my_id.genome[GEN.TEMPERATURE_OPTIMAL] + my_id.genome[GEN.TEMPERATURE_RANGE];
		_Topt1 = my_id.genome[GEN.TEMPERATURE_OPTIMAL];
		_Tmin  = my_id.genome[GEN.TEMPERATURE_OPTIMAL] - my_id.genome[GEN.TEMPERATURE_RANGE];
	
		
		_reproduction_interval = years_to_sim_steps(my_id.genome[GEN.REPRODUCTION_INTERVAL])*random_range(0.9, 1.1);	// steps
		_reproduction_distance = my_id.genome[GEN.REPRODUCTION_DISTANCE]*random_range(0.9, 1.1);		
	
		
		// calculate Leaf Mass Allocation
		
		
		if my_id.is_plant {
			_biomass_eat_allocation = biomass_leaf_allocation(my_id);	
			
			// if leaf_allocation is not valid creature die
			if _biomass_eat_allocation == -1 {
				is_dead = true;
				dead_cause = DEADCAUSE.BIRTH;
				log_events_creature_dead(my_id);
			}
		}
		else {
			_biomass_eat_allocation = my_id.genome[GEN.ALLOCATION_DIGESTIVE_ANIMALS];
		}
		

		// initial biomass allocation
				
		biomass_allocation(my_id);
		
		
			

		
	}
}