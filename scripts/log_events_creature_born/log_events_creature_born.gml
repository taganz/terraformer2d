function log_events_creature_born(_id){

	
	// update stats
	
	with controller.world {
		creatures_live_now ++;
		trophic_level_live_now[_id.genome[GEN.TROPHIC_LEVEL]]++;
		creatures_born ++;
		creatures_peak = creatures_peak <= creatures_live_now ? creatures_live_now : creatures_peak;
	}
				
	
	
	with _id.structure {
		log_event(LOGEVENT.CREATURE_BORN, _id);
		log_event(LOGEVENT.CREATURE_LIFE_EVENT,		_id, "spawn_as_adult="+string(_id.creature_spawn_as_adult)+", generation="+string(generation)+", biomass: "+string(biomass), "");
		
		//log_event(LOGEVENT.CREATURE_BORN_INFO,	   _id, "creature_sprite_head", sprite_get_name(_id.creature_sprite_head));
		log_event(LOGEVENT.CREATURE_BORN_INFO,	   _id, "Climate", climate_to_string(_id.my_cell.climate));
		log_event(LOGEVENT.CREATURE_BORN_INFO,	   _id, "Soil", soil_to_string(_id.my_cell.soil_type));
		
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "age", string(sim_steps_to_years(_id.structure.age)));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "age_die", string(sim_steps_to_years(age_die)));
		
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "biomass birth", string(_biomass_given_by_parent));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "biomass adult", string(_id.genome[GEN.BIOMASS_ADULT]));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "_biomass_adult_max", string(_biomass_adult_max));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "_biomass_reproduction_max", string(_biomass_reproduction_max));
		
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "generation", string(generation));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "_reproduction_interval", string(sim_steps_to_years(_reproduction_interval)));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "cell", cell_to_string(_id.my_cell));				
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "_Topt1", string(_Topt1));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "_Topt2", string(_Topt2));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "_Tmin", string(_Tmin));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "_biomass_eat_allocation", string(_biomass_eat_allocation));
		
		// list gens
		for (var i=0;i<GEN._LENGTH_;i++) {
			log_event(LOGEVENT.CREATURE_BORN_INFO, _id, string_format_zeroes(i,2,0) +" " + gen_to_string(i), string(_id.genome[i]));
		}
		/*
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "GEN.GENUS_NAME", string(_id.genome[GEN.GENUS_NAME]));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "GEN.SPECIE_CODE", string(_id.genome[GEN.SPECIE_CODE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ALLOCATION_REPRODUCTIVE", string(_id.genome[GEN.ALLOCATION_REPRODUCTIVE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ALLOCATION_DIGESTIVE_ANIMALS", string(_id.genome[GEN.ALLOCATION_DIGESTIVE_ANIMALS]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.BIOMASS_LIFE_FACTOR", string(_id.genome[GEN.BIOMASS_LIFE_FACTOR]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION", string(_id.genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.SPECIE_HUE", string(_id.genome[GEN.SPECIE_HUE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.TEMPERATURE_OPTIMAL", string(_id.genome[GEN.TEMPERATURE_OPTIMAL]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.TEMPERATURE_RANGE", string(_id.genome[GEN.TEMPERATURE_RANGE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.BIOMASS_BIRTH", string(_id.genome[GEN.BIOMASS_BIRTH]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ANABOLISM_BIOMASS_PER_WATER_L", string(_id.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.KC_METABOLIC_RATE", string(_id.genome[GEN.KC_METABOLIC_RATE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.DORMANCY_CATABOLISM_REDUCTION", string(_id.genome[GEN.DORMANCY_CATABOLISM_REDUCTION]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.EVOTRANSPIRATION_FACTOR", string(_id.genome[GEN.EVOTRANSPIRATION_FACTOR]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.COMBAT_ATTACK_POINTS", string(_id.genome[GEN.COMBAT_ATTACK_POINTS]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.COMBAT_DEFENSE_POINTS", string(_id.genome[GEN.COMBAT_DEFENSE_POINTS]));
		*/
		

	
	}
	
	log_event(LOGEVENT.SPECIE_BORN, _id);


}