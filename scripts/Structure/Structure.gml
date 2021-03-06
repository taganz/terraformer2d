/*

	Structure 
	
	Represents the creature actual "body" state
	If formed by cells --> nutrients
	Creature parameters are based on genome and modified by actual structure state.
	In
		_id
		_spawn_as_adult
	
		
*/


function Structure(_id, _spawn_as_adult) constructor {



#region Initilizations

	my_id = _id;
	generation = 1;				
	
	// -- age
	
	age = 0 ;								// sim steps
	age_is_adult = false;			// maximum biomass is attained
	age_die = years_to_sim_steps(my_id.genome[GEN.AGE_DEAD])*random_range(0.9, 1.5);		


	
	// -- biomass
	
	// give some biomass by default for 1st generation creatures.
	// parent will update with real value in step_reproduction() for next generations
	biomass = _spawn_as_adult ? kg_to_units(_id.genome[GEN.BIOMASS_ADULT]) : kg_to_units(_id.genome[GEN.BIOMASS_BIRTH]);
	biomass_adult = kg_to_units(_id.genome[GEN.BIOMASS_ADULT]);

	// -- biomass allocation = eat + body + reproduction + reserve (difference)
	
	biomass_eat = 0;					// leaf for plants
	biomass_body = 0;					// trunk for plants
	biomass_reproduction = 0;			
	
	// creature has a reserve of 0-max. max is a fraction of _biomass_max
	// if reserve goes
	//		below 0.8: creature is hungry
	//		below 0.5: creature is starving
	//		below 0: creature dies
	biomass_reserve = 0;
	biomass_reproduction_adult = 0;		// used for animals <---

	_biomass_reserve_max = 0;
	_biomass_max = biomass;
	_biomass_reproduction_max = biomass_adult * my_id.genome[GEN.ALLOCATION_REPRODUCTIVE]; 

	
	// -- health
	
	is_hungry = true;
	is_starving = true;
	is_dead = false;
	dead_cause = -1;
	
	// -- reproduction
	
	reproduction_count = 0;			// times reproduction done
	reproduction_age_last_time = -1;		// age at last reproduction
	_reproduction_interval = years_to_sim_steps(my_id.genome[GEN.REPRODUCTION_INTERVAL])*random_range(0.9, 1.1);	// steps
	_reproduction_distance = my_id.genome[GEN.REPRODUCTION_DISTANCE]*random_range(0.9, 1.1);		

	
	// -- private vars
	
	_first_execution = true;
	

#endregion


	

}