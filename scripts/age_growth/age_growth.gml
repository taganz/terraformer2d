/*

	to be called at each sim_step_entry
	
	updates
		age: increment
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
	
		age += 1;
		
		//show_debug_message(string(_id)+" age: "+string(age)+" age_to_year:"+string(sim_steps_to_years(age))
		//+" sim_step:"+string(controller.time.current_sim_step)+ " sim_month" +string(controller.time.current_sim_month)
		//+ " sim_year:" +string(controller.time.current_sim_year));
		
		// -- to old?
		
		if age > age_die {
			is_dead = true;
			dead_cause = DEADCAUSE.OLD;
		}
				
		// -- grown up?
			
		else {

			// can reproduce
				
			if age_is_adult_reproduction==false && biomass > kg_to_units(my_id.dna.genome[GEN.BIOMASS_REPRODUCTION]) {
				age_is_adult_reproduction = true;
				LOG(LOGEVENT.CREATURE_ADULT, _id, "adult_reproduction");

				age_is_adult_growth = true;    // <---??
				LOG(LOGEVENT.CREATURE_LIFE_EVENT, _id, "age_is_adult_growth", "");
				biomass_reproduction_adult = biomass_reproduction;  // <--- ??
				LOG(LOGEVENT.CREATURE_ADULT, _id, "biomass_reproduction_adult: "+string(units_to_kg(biomass_reproduction_adult)));
				reproduction_is_ready = true;
				//LOG(LOGEVENT.CREATURE_LIFE_EVENT, _id, "reproduction_is_ready", "");

			}

	
			// time for reproduction? 
			if age_is_adult_reproduction and age - reproduction_age_last_time > reproduction_interval {
				reproduction_is_ready = true;
				//LOG(LOGEVENT.CREATURE_LIFE_EVENT, _id, "reproduction_is_ready", "");
			}
	
	
	
	
		}
	}
}

