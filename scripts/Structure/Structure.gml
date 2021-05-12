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


	my_id = _id;
	generation = 1;				
	
	// some metabolic functions are different in plants and animals
	

	// -- age
	
	age = 0 ;							// sim steps
	age_is_adult = _spawn_as_adult;		// biomass_adult has been attained
	age_die = -1;
	

	
	// -- biomass
	
	// give some biomass by default for 1st generation creatures.
	// parent will update with real value in step_reproduction() for next generations
	biomass = -1;
	biomass_adult = -1;
		

	// -- biomass allocation = eat + body + reproduction + reserve (difference)
	biomass_eat = 0;					// leaf for plants
	biomass_body = 0;					// trunk for plants
	biomass_reproduction = 0;			
	_biomass_eat_allocation = -1;		// different in plants and animals
	
	// creature has a reserve of 0-max. max is a fraction of _biomass_max
	// if reserve goes
	//		below 0.8: creature is hungry
	//		below 0.5: creature is starving
	//		below 0: creature dies
	biomass_reserve = 0;
	
	// -- biomass reproduction
	//biomass_reproduction_adult = 0;		// used for animals <---

	_biomass_reserve_max = -1;
	_biomass_max = -1;						// max biomass attained by creature
	_biomass_reproduction_max = -1;

	
	// -- health
	
	is_hungry = true;
	is_starving = true;
	is_dead = false;
	dead_cause = -1;
	
	// -- reproduction
	
	reproduction_count = 0;					// times reproduction done
	reproduction_offspring_count = 0;		// total number of offspring 
	reproduction_age_last_time = -1;		// age at last reproduction
	_reproduction_interval = -1;
	_reproduction_distance = -1;
	

	_Topt2 = -1;
	_Topt1 = -1;
	_Tmin  = -1;
	


	anabolism_input = -1;
	_metabolism_steps_per_month = -1; // time correction factor for animals
	
	// === animal specific
	
	//animal_eaten_biomass = 0;


	// === plant specific 
	
	// this is updated by world cell for each plant cycle 
	//plant_roots_absorbed_water = -1;
	//plant_received_sun = -1;

}