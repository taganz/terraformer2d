/*

	Structure 
	
	Represents the creature actual "body" state
	If formed by cells --> nutrients
	Creature parameters are based on genome and modified by actual structure state.
	In
		_id
		_spawn_as_adult
	
		
*/

#macro FRACTION_AGE_ADULT_STARVATION_PROTECTION 0.5


function Structure(_id, _spawn_as_adult) constructor {



#region Initilizations

	my_id = _id;
	generation = 1;				
	
	// -- age
	
	age = 0 ;								// sim steps
	age_is_adult = false;			// maximum biomass is attained
	//age_is_adult_reproduction = false;		// can reproduce

	age_die = years_to_sim_steps(my_id.dna.genome[GEN.AGE_DEAD])*random_range(0.9, 1.5);		


	
	// -- biomass
	
	// give some biomass by default for 1st generation creatures.
	// parent will update with real value in step_reproduction() for next generations
	biomass = _spawn_as_adult ? kg_to_units(_id.dna.genome[GEN.BIOMASS_ADULT]) : kg_to_units(_id.dna.genome[GEN.BIOMASS_BIRTH]);
	
	biomass_max = biomass;
	
	biomass_at_birth = biomass;

	// creature has a reserve of 0-max. max is a fraction of biomass_max
	// if reserve goes
	//		below 0.8: creature is hungry
	//		below 0.5: creature is starving
	//		below 0: creature dies
	biomass_reserve_max = biomass_max * my_id.dna.genome[GEN.ALLOCATION_RESERVE];;
	biomass_reserve = biomass_reserve_max;

	// -- biomass allocation = eat + body + reproduction + reserve (difference)
	
	biomass_eat = 0;					// leaf for plants
	biomass_body = 0;					// trunk for plants
	biomass_reproduction = 0;			
	_biomass_reproduction_max = my_id.dna.genome[GEN.BIOMASS_ADULT] * (1 - my_id.dna.genome[GEN.ALLOCATION_RESERVE]); 
	
	biomass_reproduction_adult = 0;		// used for animals <---
	
	
	// -- health
	
	is_hungry = true;
	is_starving = true;
	is_dead = false;
	dead_cause = -1;
	
	// -- reproduction
	
	reproduction_is_ready = false;
	reproduction_interval = years_to_sim_steps(my_id.dna.genome[GEN.REPRODUCTION_INTERVAL])*random_range(0.9, 1.1);	// steps
	reproduction_age_last_time = -1;		// age at last reproduction
	reproduction_distance = my_id.dna.genome[GEN.REPRODUCTION_DISTANCE]*random_range(0.9, 1.1);		
	reproduction_count = 0;			// times reproduction done

	
	// -- private vars
	
	_first_execution = true;
	

#endregion

	
	// === utils
	
	to_string = function () {
		return 
			  "Age / dead: "+string(age) + " ("+string(sim_steps_to_years(age))+" y)"+ ", "+string(age_die) + " ("+string(sim_steps_to_years(age_die))+" y)"
			+ "\nis_hungry/starving: "+string(is_hungry)+", "+string(is_starving)
			+ "\nLast reproduction / count: "+string(reproduction_age_last_time)+", "+string(reproduction_count)
			+ "\nbiomass / max: "+string(biomass) + ", "+string(biomass_max)
			+ "\ngeneration: "+string(generation)
			;
	}
	
	
	

}