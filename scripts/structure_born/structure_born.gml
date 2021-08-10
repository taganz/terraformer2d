/*

 called by state_born
 initialize structure vars after genome has mutated


*/


function structure_born(my_id){

	// will return false is something bad happens 
	var born_ok = true;

	if my_id.is_plant == false
		var breakpoint_animal = true;

	with my_id.structure {

		age = 0;
		age_die = years_to_sim_steps(my_id.genome[GEN.AGE_DEAD])*random_range(1, 1.3);		


		// -- biomass and hunger
	
		biomass_adult_genome = my_id.genome[GEN.BIOMASS_ADULT];
		_biomass_adult_max_genome = biomass_adult_genome * (1 + my_id.genome[GEN.ALLOCATION_REPRODUCTIVE]) * 1.1;				// max biomass attainable by creature
		_biomass_reproduction_max = biomass_adult_genome * my_id.genome[GEN.ALLOCATION_REPRODUCTIVE]; 
		is_hungry = true;
		is_starving = true;
	
		// -- size
		
		// height will grow linearly with biomass up to height_adult (m/kg)
		_height_growth_factor = my_id.genome[GEN.HEIGHT_ADULT]/my_id.genome[GEN.BIOMASS_ADULT];
		var _my_area = family_get_area(my_id.genome[GEN.FAMILY]),
		_my_area = _my_area * (my_id.genome[GEN.FAMILY]=="fam_crop" ? 1 : random_range (0.9, 1.1));
		my_width = sqrt(_my_area);
		
		// -- set biomass at birth. 1st generations is always adult
		
		if 	generation==0  {
			
			// add random biomass to avoid all creatures giving birth at the same time
			
			biomass_modify(my_id, biomass_adult_genome + random(_biomass_reproduction_max));
			
			// assign random age
			
			age = age_die * random_range(0.2, 0.4);
		}
		else {
			
			// parent will update with real value in step_reproduction() for next generations
			
			biomass_modify(my_id, _biomass_given_by_parent);
		}	
		
		
		// -- reproduction
		
		_reproduction_interval = years_to_sim_steps(my_id.genome[GEN.REPRODUCTION_INTERVAL])*random_range(0.8, 1.2);	// steps
		_reproduction_distance_px = world_m_to_px(my_id.genome[GEN.REPRODUCTION_DISTANCE_M]*random_range(0.9, 1.1));		
	
		// avoid 1st generation giving birth at the same time
		if generation == 0 {
			reproduction_age_last_time = age - _reproduction_interval * random_range(0.7, 0.9);
		}

		// -- anabolism 
	
		// anabolism is affected by a temperature coefficient
		//  - below Tmin:  kt = 0
		//	- range Tmin - Topt1:  kt =  grow linearly from 0 to 1
		//  - range Topt1 - Topt2: kt = 1 
		//	- above Topt2: kt = 0

		// ka_anabolism_factor: kg biomass obtained from kg of anabolism_input (kg/kg/month)
		ka_anabolism_factor = 2 / 3 * my_id.genome[GEN.KA_AREA] / my_id.genome[GEN.TEMPERATURE_RANGE];

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
				born_ok = false;
			}
		}
		else {
			_biomass_eat_allocation = my_id.genome[GEN.ALLOCATION_DIGESTIVE_ANIMALS];
		}
		

		if born_ok {
			
			// == initial biomass allocation
				
			biomass_allocation(my_id);
		
			// == speed
			var _speed_slow_px = world_m_to_px(my_id.genome[GEN.SPEED_SLOW]);
			var _speed_fast_px = world_m_to_px(my_id.genome[GEN.SPEED_FAST]);
		
			if my_id.is_primary{
		
				speed_wander_px = _speed_slow_px;		// looking for food
				speed_eat_px = _speed_slow_px;			// looking for food
				speed_eat_m = world_px_to_m(speed_eat_px);
				speed_escape_px = _speed_fast_px;		// escaping from threat
			}
		
			if my_id.is_secondary{
		
				speed_wander_px = _speed_slow_px;		// looking for food
				speed_eat_px = _speed_fast_px;			// chasing
				speed_eat_m = world_px_to_m(speed_eat_px);
			}
		
			// == senses
		
			if my_id.is_plant == false {
			
				view_range_m = my_id.genome[GEN.VIEW_RANGE];
				//view_range_px = world_m_to_px(view_range_m);
			}
			
		}
		
	}
	
	return born_ok;
}