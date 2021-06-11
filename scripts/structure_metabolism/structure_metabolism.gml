
	// doc to be reviews
	
	// === do_metabolism	
	//
	//  anabolism = biomass_eaten * k anabolism * k temperature
	//	catabolim = biomass_body * k catabolism * k temperature
	//
	//	updates
	//		age: increment
	//		biomass: anabolism (eaten biomass) - catabolism (biomass)
	//		is_dead, dead_cause
	//		is_adult
	//		animal_eaten_biomass
	
	
function structure_metabolism(my_id){

	with my_id.structure {
		
		_has_eaten_this_time = false;
				
		log_event(LOGEVENT.CREATURE_ANABOLISM_INPUT, my_id, anabolism_input);
		log_event(LOGEVENT.CREATURE_RAIN, my_id, my_id.my_cell.rain_current_month);
		log_event(LOGEVENT.CREATURE_CELL_PLANTS_AVAILABLE_WATER, my_id, my_id.my_cell.plants_available_water);
				
		// === anabolism
		
		var _quant_anabolism = anabolism_input * my_id.genome[GEN.KA_ANABOLISM_FACTOR]  / _metabolism_steps_per_month ;  // kc kg/kg /month;
		
		// temperature affects anabolism. under Tmin or over _Topt2 anabolism stops.
		var _anabolism_temperature_factor = my_id.my_cell.temperature_current_month > _Topt2 
					? 0 
					: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, 1);
		_quant_anabolism *= _anabolism_temperature_factor;
		
		_has_eaten_this_time = _quant_anabolism > 0;	// used by morphology
		
		log_event(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "anabolism_input: "+string(anabolism_input)+", T:" + string(my_id.my_cell.temperature_current_month)+", kt: "+string(_anabolism_temperature_factor));
		anabolism_input = my_id.is_plant ? 0 : anabolism_input -  _quant_anabolism / my_id.genome[GEN.KA_ANABOLISM_FACTOR]  * TIME_SIM_STEPS_PER_MONTH;				  
		//anabolism_input -= _quant_anabolism / my_id.genome[GEN.KA_ANABOLISM_FACTOR]  * TIME_SIM_STEPS_PER_MONTH;				  
			
		// === catabolism
		var _catabolism_temperature_factor =  clamp(
					my_id.genome[GEN.DORMANCY_CATABOLISM_REDUCTION]
					* (my_id.my_cell.temperature_current_month - _Tmin)
					/ (_Topt1-_Tmin)
					+ 1 - my_id.genome[GEN.DORMANCY_CATABOLISM_REDUCTION] 
						, 0, 1);
		var _quant_catabolism = biomass_body * my_id.genome[GEN.KC_METABOLIC_RATE] * _catabolism_temperature_factor / _metabolism_steps_per_month;  // kc kg/kg /month
		log_event(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism, 
						"T:" + string(my_id.my_cell.temperature_current_month)+", Kctf: "+string(_catabolism_temperature_factor));
		log_event(LOGEVENT.CREATURE_TEMPERATURE, my_id, my_id.my_cell.temperature_current_month, _anabolism_temperature_factor, _catabolism_temperature_factor );
				
		// === change biomass

		biomass_modify (my_id, _quant_anabolism - _quant_catabolism);
	}			
		
}	