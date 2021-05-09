
	// doc to be reviews
	
	// === do_metabolism	
	//
	//  anabolism = biomass_eaten * k anabolism * k temperature
	//	catabolim = biomass_body * k catabolism
	//
	//	updates
	//		age: increment
	//		biomass: anabolism (eaten biomass) - catabolism (biomass)
	//		is_dead, dead_cause
	//		is_adult
	//		animal_eaten_biomass
	
	
function structure_metabolism_animal(my_id){

	with my_id.structure {
				
		log_event(LOGEVENT.CREATURE_NUTRIENTS_RECEIVED, my_id, animal_eaten_biomass);
		log_event(LOGEVENT.CREATURE_RAIN, my_id, my_id.my_cell.rain_current_month);
		log_event(LOGEVENT.CREATURE_CELL_PLANTS_AVAILABLE_WATER, my_id, my_id.my_cell.plants_available_water);
				
		// === anabolism
		
		var _quant_anabolism = animal_eaten_biomass * my_id.genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION];
		// temperature affects anabolism. under Tmin or over _Topt2 anabolism stops.
		var _anabolism_temperature_factor = my_id.my_cell.temperature_current_month > _Topt2 
					? 0 
					: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, 1);
		_quant_anabolism *= _anabolism_temperature_factor;
		log_event(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "animal_eaten_biomass: "+string(animal_eaten_biomass)+", T:" + string(my_id.my_cell.temperature_current_month)+", kt: "+string(_anabolism_temperature_factor));
		animal_eaten_biomass -= _quant_anabolism;				  
			
		// === catabolism
		var _catabolism_temperature_factor =  clamp(
					my_id.genome[GEN.DORMANCY_CATABOLISM_REDUCTION]
					* (my_id.my_cell.temperature_current_month - _Tmin)
					/ (_Topt1-_Tmin)
					+ 1 - my_id.genome[GEN.DORMANCY_CATABOLISM_REDUCTION] 
						, 0, 1);
		var _quant_catabolism = biomass_body * my_id.genome[GEN.KC_METABOLIC_RATE];
		log_event(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism, 
						"T:" + string(my_id.my_cell.temperature_current_month)+", Kctf: "+string(_catabolism_temperature_factor));
		log_event(LOGEVENT.CREATURE_TEMPERATURE, my_id, my_id.my_cell.temperature_current_month, _anabolism_temperature_factor, _catabolism_temperature_factor );
				
		// === change biomass

		biomass_modify (my_id, _quant_anabolism - _quant_catabolism);
	}			
		
}	