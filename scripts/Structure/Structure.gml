/*

	Structure 
	
	Represents the creature actual "body" state
	Creature parameters are based on genome and modified by actual structure state.

		
*/


function Structure(_id, _spawn_as_adult) constructor {


	my_id = _id;
	generation = 0;				
		

	// -- age
	
	age = -1 ;				// sim steps
	age_die = -1;
	

	
	// -- biomass
	
	biomass = 0;
		
	_biomass_given_by_parent = -1;
	
	// biomass allocation 
	biomass_eat = 0;					// leaf for plants
	biomass_body = 0;					// trunk for plants
	biomass_reproduction = 0;			
	
	// biomass and hunger
	
	biomass_adult_genome = -1;			// defined by GEN.BIOMASS_ADULT
	_biomass_adult_max_genome = -1;		// max biomass attainable by creature including reproductive
	_biomass_max = -1;					// max biomass attained by creature
	_biomass_reproduction_max = -1;
	_biomass_life = -1;					// minimum biomass to keep alive
	_biomass_eat_allocation = -1;		
	is_hungry = true;
	is_starving = true;
	
	// size
	
	my_height = -1;						// can not use 'height' for some GM technical issues
	_height_growth_factor = -1;
	my_width = -1;						
	
	// -- dead status
	
	is_dead = false;
	dead_cause = -1;
	
	
	// -- reproduction
	
	reproduction_count = 0;					// times reproduction done
	reproduction_offspring_count = 0;		// total number of offspring 
	reproduction_age_last_time = -1;		// age at last reproduction

	_reproduction_interval = -1;
	_reproduction_distance_px = -1;
	
	
	// -- anabolism  
	
	ka_anabolism_factor = -1;		// kg biomass obtained from kg of anabolism_input (kg/kg/month)
	_Topt2 = -1;
	_Topt1 = -1;
	_Tmin  = -1;
	anabolism_input = -1;
	_metabolism_steps_per_month = -1; // time correction factor for animals
	
	_has_eaten_this_time = false;		// used in morphology
	
	
	min_biomass_fraction_to_eat = _id.is_plant ? PRODUCER_BIOMASS_MINIMUM_EAT : PRIMARY_BIOMASS_MINIMUM_EAT;

	
	// -- speed
	
	speed_wander_px = -1;			// speed looking for food
	speed_eat_px = -1;				// speed chasing food
	speed_eat_m = -1;
	speed_escape_px = -1;			// speed escaping from threat
	
	// -- senses
	
	view_range_m = -1;			// distance can see food or threat
	view_range_px = -1;
	
}