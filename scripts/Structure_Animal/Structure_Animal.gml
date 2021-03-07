/*

	Structure_Animal
	
	
*/

function Structure_Animal(_id, _spawn_as_adult):Structure(_id, _spawn_as_adult)  constructor {


	
	eaten_biomass = -1;
	_biomass_eat_allocation = _id.genome[GEN.ALLOCATION_DIGESTIVE];


	// === do_metabolism	
	// updates
	//		age: increment
	//		biomass: anabolism (eaten biomass) - catabolism (biomass)
	//		is_dead, dead_cause
	//		is_adult
	//		eaten_biomass
	//
	do_metabolism = function () {

		// can not do this at initialization
		if _first_execution {
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Topt1", _Topt1);
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Topt2", _Topt2);
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Tmin", _Tmin);
			_first_execution = false;
			
			// initial biomass allocation
			biomass_eat = biomass * _biomass_eat_allocation;
			biomass_body = biomass - biomass_eat;
			_biomass_max = biomass;
			_biomass_reserve_max = _biomass_max * my_id.genome[GEN.ALLOCATION_RESERVE];
			}


		//ASSERT(is_dead==false, my_id, "dead creature entering do_metabolism animal "+string(my_id));


		// -- anabolism and catabolism
		
		// anabolism
		var _quant_anabolism = eaten_biomass * my_id.genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION];
		// temperature affects anabolism. under Tmin or over _Topt2 anabolism stops.
		var _temp_factor = my_id.my_cell.temperature_current_month > _Topt2 
					? 0 
					: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, 1);
		_quant_anabolism *= _temp_factor;
		log_event(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "eaten_biomass: "+string(eaten_biomass)+", T:" + string(my_id.my_cell.temperature_current_month)+", kt: "+string(_temp_factor));
		eaten_biomass -= _quant_anabolism;				  
			
		// catabolism
		var _quant_catabolism = biomass_body * my_id.genome[GEN.METABOLIC_RATE];
		log_event(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism);

		// -- change biomass

		biomass_modify (my_id, _quant_anabolism - _quant_catabolism);
				
		}
	
}