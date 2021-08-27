
	// doc to be reviewed
	
	// === do_metabolism	
	//
	//  biomass change = anabolism (kg) - catabolism (kg)
	//
	//  anabolism = anabolism_input * k anabolism * anabolism_temperature_factor
	//	catabolim = biomass_body * k catabolism * catabolism_temperature_factor
	//
	// updates
	//	_has_eaten_this_time
	
	
function structure_metabolism(my_id){

	with my_id.structure {
		
		_has_eaten_this_time = false;
				
		log_event(LOGEVENT.CREATURE_ANABOLISM_INPUT, my_id, anabolism_input);
		ASSERT(my_id.my_cell > 0, my_id, "structure_metabolism my_cell <= 0");
		log_event(LOGEVENT.CREATURE_RAIN, my_id, my_id.my_cell.rain_current_month);
		log_event(LOGEVENT.CREATURE_CELL_PLANTS_AVAILABLE_WATER, my_id, my_id.my_cell.plants_available_water);
					
		// === anabolism
		
		// temperature affects anabolism
		//         < Tmin     : 0
		//      Tmin - Topt1  : linial from 0 to ka_anabolism_factor
		//      Topt1 - Topt2 : ka_anabolism_factor
		//           > Topt2  : 0
		//var _anabolism_temperature_factor = my_id.my_cell.temperature_current_month > _Topt2 
		//			? 0 
		//			: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, ka_anabolism_factor);			
		if my_id.my_cell.temperature_current_month > _Topt2 
			var _anabolism_temperature_factor = 0;
		else if my_id.my_cell.temperature_current_month > _Topt1
			var _anabolism_temperature_factor = ka_anabolism_factor;
		else
			var _anabolism_temperature_factor = map(my_id.my_cell.temperature_current_month, _Tmin, _Topt1, 0, ka_anabolism_factor);
					
		var _quant_anabolism = anabolism_input / _metabolism_steps_per_month * _anabolism_temperature_factor;   // kc kg/kg /month;
		
		_has_eaten_this_time = _quant_anabolism > 0;	// used by morphology
		
		log_event(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "anabolism_input: "+string(anabolism_input)+", T:" + string(my_id.my_cell.temperature_current_month)+", ka: "+string(_anabolism_temperature_factor));
		
		// substract used part
		anabolism_input = my_id.is_plant ? 0 : (anabolism_input - (_quant_anabolism * _metabolism_steps_per_month));				  
		

		
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
				
		// === change biomass

		biomass_modify (my_id, _quant_anabolism - _quant_catabolism);


		log_event(LOGEVENT.CREATURE_TEMPERATURE, my_id, my_id.my_cell.temperature_current_month, _anabolism_temperature_factor, _catabolism_temperature_factor );

	}			
		
}	