/*

	to be called at each sim_step_entry or sim_month_entry
	
	updates
		age: increments 1 sim_step for consumers, 1 month for producers
		age_is_adult_reproduction
		age_is_adult_growth
		is_dead
		dead_cause  DEADCAUSE.OLD
		reproduction_is_ready
		biomass_reproduction_adult 
	
*/	

function age_growth(_id){

	assert(controller.time.sim_step_entry, "age_growth invalid call");
	
	with _id.structure {
	
		age += _id.is_producer ? TIME_SIM_STEPS_PER_MONTH : 1;					// sim_steps
		

		// -- to old?
		
		if age > age_die {
			is_dead = true;
			dead_cause = DEADCAUSE.OLD;
		}
				
		// -- grown up?
			
		else {

			// can reproduce
				
			if age_is_adult_reproduction==false && biomass > kg_to_units(_id.dna.genome[GEN.BIOMASS_REPRODUCTION]) {
				age_is_adult_reproduction = true;
				LOG(LOGEVENT.CREATURE_LIFE_EVENT, _id, "adult_reproduction", "biomass: "+string(biomass));

				biomass_reproduction_adult = biomass_reproduction;  // <--- ??
				reproduction_is_ready = true;

			}

			// already adult?
			
			if age_is_adult_growth == false and biomass > _id.dna.genome[GEN.BIOMASS_ADULT]*0.9 {
				age_is_adult_growth = true;
				LOG(LOGEVENT.CREATURE_LIFE_EVENT, _id, "adult_growth", "biomass: "+string(biomass));
			}
			
			// time for reproduction? 
			if age_is_adult_reproduction and age - reproduction_age_last_time > reproduction_interval {
				reproduction_is_ready = true;
			}
	
	
	
	
		}
	}
}

