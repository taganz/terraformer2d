
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

		
		
		// === anabolism
		
		var _quant_anabolism = animal_eaten_biomass * my_id.genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION];
		// temperature affects anabolism. under Tmin or over _Topt2 anabolism stops.
		var _temp_factor = my_id.my_cell.temperature_current_month > _Topt2 
					? 0 
					: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, 1);
		_quant_anabolism *= _temp_factor;
		log_event(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "animal_eaten_biomass: "+string(animal_eaten_biomass)+", T:" + string(my_id.my_cell.temperature_current_month)+", kt: "+string(_temp_factor));
		animal_eaten_biomass -= _quant_anabolism;				  
			
		// === catabolism
		
		var _quant_catabolism = biomass_body * my_id.genome[GEN.KC_METABOLIC_RATE];
		log_event(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism);

		// === change biomass

		biomass_modify (my_id, _quant_anabolism - _quant_catabolism);
				
		
}	