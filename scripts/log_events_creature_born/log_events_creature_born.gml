// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function log_events_creature_born(_id){

	
	
	with _id.structure {
		log_event(LOGEVENT.CREATURE_BORN, _id);
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "GEN.INITIAL_SPECIE_NAME", string(_id.genome[GEN.INITIAL_SPECIE_NAME]));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "GEN.SPECIE_CODE", string(_id.genome[GEN.SPECIE_CODE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "creature_sprite_head", sprite_get_name(_id.creature_sprite_head));
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "Climate", climate_to_string(_id.my_cell.climate));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "age", sim_steps_to_years(_id.structure.age));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "age_die", sim_steps_to_years(age_die));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "biomass", units_to_kg(biomass));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "biomass birth", units_to_kg(_id.genome[GEN.BIOMASS_BIRTH]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "biomass adult", units_to_kg(_id.genome[GEN.BIOMASS_ADULT]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ALLOCATION_REPRODUCTIVE", string(_id.genome[GEN.ALLOCATION_REPRODUCTIVE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ALLOCATION_DIGESTIVE_ANIMALS", string(_id.genome[GEN.ALLOCATION_DIGESTIVE_ANIMALS]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ALLOCATION_RESERVE", string(_id.genome[GEN.ALLOCATION_RESERVE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION", string(_id.genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.TEMPERATURE_OPTIMAL", string(_id.genome[GEN.TEMPERATURE_OPTIMAL]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.TEMPERATURE_RANGE", string(_id.genome[GEN.TEMPERATURE_RANGE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.BIOMASS_BIRTH", string(_id.genome[GEN.BIOMASS_BIRTH]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.ANABOLISM_BIOMASS_PER_WATER_L", string(_id.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.KC_METABOLIC_RATE", string(_id.genome[GEN.KC_METABOLIC_RATE]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.DORMANCY_CATABOLISM_REDUCTION", string(_id.genome[GEN.DORMANCY_CATABOLISM_REDUCTION]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "GEN.EVOTRANSPIRATION_FACTOR", string(_id.genome[GEN.EVOTRANSPIRATION_FACTOR]));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "generation", generation);
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "_reproduction_interval", sim_steps_to_years(_reproduction_interval));
		log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, _id, "_reproduction_distance", _reproduction_distance);
		log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "cell", cell_to_string(_id.my_cell));		
	}
	
	log_event(LOGEVENT.SPECIE_CLIMATE_BORN, _id);


}