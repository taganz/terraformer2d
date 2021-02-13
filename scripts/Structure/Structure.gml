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

enum DEADCAUSE {
	OLD,
	STARVING,
	EATEN
}
function deadcause_to_string(_dead_cause) {
	var _msg = "???";
	switch (_dead_cause) {
	    case  DEADCAUSE.OLD: _msg = "OLD"; break;
	    case  DEADCAUSE.STARVING: _msg = "STARVING"; break;
	    case  DEADCAUSE.EATEN: _msg = "EATEN"; break;
	}
	return _msg;
}


function Structure(_id, _spawn_as_adult) constructor {



#region Initilizations

	_first_execution = true;
	my_id = _id;
	generation = 1;				
	
	//age_adult = controller.time.years_to_sim_steps(my_id.dna.genome[GEN.AGE_ADULT])*random_range(0.9, 1.5);
	//age_die = controller.time.years_to_sim_steps(my_id.dna.genome[GEN.AGE_DEAD])*random_range(0.9, 1.5);		
	age_adult = years_to_sim_steps(my_id.dna.genome[GEN.AGE_ADULT])*random_range(0.9, 1.5);
	age_die = years_to_sim_steps(my_id.dna.genome[GEN.AGE_DEAD])*random_range(0.9, 1.5);		
	
	age = _spawn_as_adult ? age_adult : 0 ;
	is_adult_growth = _spawn_as_adult;				// maximum growth
	is_adult_reproduction = _spawn_as_adult;		// can reproduce
	
	
	
	// give some biomass by default for 1st generation creatures.
	// parent will update with real value in step_reproduction() for next generations
	// if spawn_as_adult assume constant growth
	biomass = _spawn_as_adult ? kg_to_units(_id.dna.genome[GEN.BIOMASS_ADULT]) : kg_to_units(_id.dna.genome[GEN.BIOMASS_BIRTH]);
	biomass_max = biomass;
	biomass_at_birth = biomass;
	biomass_max_minimum_fraction_live = BIOMASS_MAX_MINIMUM_FRACTION_LIVE;	// if biomass is under this creatures dies
	
	is_hungry = true;
	is_starving = true;
	is_dead = false;
	dead_cause = -1;
	is_prepared_for_reproduction = false;
	
	reproduction_interval = years_to_sim_steps(my_id.dna.genome[GEN.REPRODUCTION_INTERVAL])*random_range(0.9, 1.1);	// steps
	//reproduction_time_first = reproduction_interval*random_range(0.1, 0.3);  // after being adult)
	age_last_reproduction = -1;		// age at last reproduction
	reproduction_distance = my_id.dna.genome[GEN.REPRODUCTION_DISTANCE]*random_range(0.9, 1.1);		
	reproduction_count = 0;			// times reproduction done

	

#endregion

	

	// === biomass_modify(quant)
	// returns 
	//		modified quantity (can be a negative value)
	// updates
	//		biomass
	//		biomass_max
	//		world.biomass
	//		is_hungry   
	//		is_starving	
	//		is_dead
	//		dead_cause
	biomass_modify = function(_quant) {
		
		var _quant_got = _quant;
		
		// enough biomass?
		if biomass + _quant < 0 {
			_quant_got = -biomass;		
		}
			
		// modify biomass
		biomass += _quant_got;
		
		biomass_max = biomass < biomass_max ? biomass_max : biomass;
		
		// update statistics
		controller.world.biomass += _quant_got;
			
		// decide if hungry and if dead by starving
		if is_dead == false {
			
			// is hungry?
			if is_hungry == false {
				if biomass < biomass_max * 0.8 {
					is_hungry = true;
					LOG_ID(my_id, "HUNGRY - biomass: "+string(biomass)+", biomass_max: "+string(biomass_max));
				}
				is_starving = false;
			}
			else {
				if biomass > biomass_max * 0.95 {
						is_hungry = false;
						LOG_ID(my_id, "NOT HUNGRY - biomass: "+string(biomass)+", biomass_max: "+string(biomass_max));
				}
				is_starving = biomass < biomass_max * 0.6;
			}
			
			// has enough biomass to keep alive?
			//if (is_adult and biomass < biomass_max * biomass_max_minimum_fraction_live ) {
			if (biomass < biomass_max * biomass_max_minimum_fraction_live ) {
				is_dead = true;			
				dead_cause = DEADCAUSE.STARVING;
			}
		}
				
		return _quant_got;   
	}
	
	
	// === been_eated
	// the creature is been eaten by other creatures (state_eat)
	// update 
	//		biomass
	//		world.biomass
	//		is_hungry
	//		is_starving
	//		is_dead		
	//		dead_cause if creature dies
	
	been_eated = function(_id_attacker, _quant_organic_wanted) {
		var _quant_got = biomass < _quant_organic_wanted ? biomass : _quant_organic_wanted;
		var _was_dead = is_dead;
		biomass_modify (-_quant_got);
		LOG(LOGEVENT.CREATURE_BEEN_EATED, my_id, _id_attacker, _quant_got);
		// if it is dead after taking biomass dead cause was eaten
		if _was_dead == false && is_dead == true
				dead_cause = DEADCAUSE.EATEN;   
		return _quant_got;
	}
	
	// === utils
	
	to_string = function () {
		return 
			  "Age / adult / dead: "+string(age) + " ("+string(sim_steps_to_years(age))+" y)"+ ", "+string(age_adult) + " ("+string(sim_steps_to_years(age_adult))+" y)"+ ", "+string(age_die) + " ("+string(sim_steps_to_years(age_die))+" y)"
			+ "\nis_hungry/starving: "+string(is_hungry)+", "+string(is_starving)
			+ "\nLast reproduction / count: "+string(age_last_reproduction)+", "+string(reproduction_count)
			+ "\nbiomass / max: "+string(biomass) + ", "+string(biomass_max)
			+ "\ngeneration: "+string(generation)
			;
	}
	
	to_string_parameters = function () {
		return 
			  "age: " + string(sim_steps_to_years(age))+"y"
			+ ", age_adult:" + string(sim_steps_to_years(age_adult))+"y"
			+ ", age_die:" + string(sim_steps_to_years(age_die))+"y"
			
			+ "\nis_hungry: "+string(is_hungry)
			+", is_starving: "+string(is_starving)
			
			+ "\ngeneration: "+string(generation)
			
			//+ "\n reproduction_time_first:" + string(sim_steps_to_years(reproduction_time_first))+"y"
			+ "\nreproduction_interval:" + string(sim_steps_to_years(reproduction_interval))+"y"
			+ ", reproduction_distance:" + string(reproduction_distance)
			
			+ "\nbiomass: "	+ string(units_to_kg(biomass))+"kg, "
			+ "biomas max: " + string(units_to_kg(biomass_max))+"kg"
			
			//+ "\nbiomass_adult_minimum: " + string(units_to_kg(biomass_adult_minimum))+"kg"
			//+ ", biomass_consumed_per_step: "+ string(units_to_kg(biomass_consumed_per_step))+" kg"
			
			//+ "\nquant_mineral_wanted: " + string(units_to_kg(quant_mineral_wanted))+"kg"
			//+ ", quant_water_wanted: "   + string(units_to_kg(quant_water_wanted))+"kg"
			//+ ", quant_organic_wanted: " + string(units_to_kg(quant_organic_wanted))+"kg"
			;
	}
	
	

}