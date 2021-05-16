/*

 called by state_born
 initialize structure vars after genome has mutated


*/


function structure_born(my_id){

	with my_id.structure {


		age_die = years_to_sim_steps(my_id.genome[GEN.AGE_DEAD])*random_range(0.9, 1.5);		


		// -- biomass specie parameters
	
		biomass_adult = (my_id.genome[GEN.BIOMASS_ADULT]);
		_biomass_adult_max = biomass_adult * (1 + my_id.genome[GEN.ALLOCATION_REPRODUCTIVE]) * 1.1;				// max biomass attainable by creature
		_biomass_reproduction_max = biomass_adult * my_id.genome[GEN.ALLOCATION_REPRODUCTIVE]; 
		
		
		// -- set biomass at birth
		
		if 	generation==1 and GENUS_SPAWN_AS_ADULTS {
			// add random biomass to avoid all creatures giving birth at the same time
			biomass_modify(my_id, biomass_adult + random(my_id.genome[GEN.ALLOCATION_REPRODUCTIVE]));
		}
		else {
			// parent will update with real value in step_reproduction() for next generations
			biomass_modify(my_id, biomass_adult * my_id.genome[GEN.ALLOCATION_REPRODUCTIVE] / my_id.genome[GEN.REPRODUCTION_QUANTITY]);
		}	
		
		
		// -- reproduction
		
		_reproduction_interval = years_to_sim_steps(my_id.genome[GEN.REPRODUCTION_INTERVAL])*random_range(0.8, 1.2);	// steps
		_reproduction_distance = my_id.genome[GEN.REPRODUCTION_DISTANCE]*random_range(0.9, 1.1);		
	
		// avoid 1st generation giving birth at the same time
		if generation == 1 {
			reproduction_age_last_time = - random(my_id.genome[GEN.REPRODUCTION_INTERVAL]);
		}

		// -- anabolism 
	
		// anabolism is affected by a temperature coefficient
		//  - below Tmin:  kt = 0
		//	- range Tmin - Topt1:  kt =  grow linearly from 0 to 1
		//  - range Topt1 - Topt2: kt = 1 
		//	- above Topt2: kt = 0

		_Topt2 = my_id.genome[GEN.TEMPERATURE_OPTIMAL] + my_id.genome[GEN.TEMPERATURE_RANGE];
		_Topt1 = my_id.genome[GEN.TEMPERATURE_OPTIMAL];
		_Tmin  = my_id.genome[GEN.TEMPERATURE_OPTIMAL] - my_id.genome[GEN.TEMPERATURE_RANGE];

		// anabolims input is the quantity that will convert to metabolism mass increment 
		//  - absorbed water for plants
		//  - eaten biomass for animals
		anabolism_input = 0;
		_metabolism_steps_per_month = my_id.is_plant ? 1 : TIME_SIM_STEPS_PER_MONTH;
		

		
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
		

		// == initial biomass allocation
				
		biomass_allocation(my_id);
		
		
			

		
	}
}