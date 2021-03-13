/*

	Structure_Plant

	
	
*/
#macro TEMPERATURE_DISTRIBUTION_MARGIN  2  // from Topt - margin to Topt + margin anabolims is optimum
function Structure_Plant(_id, _spawn_as_adult):Structure(_id, _spawn_as_adult) constructor {

	// this is sent by world cell for each plant cycle 
	
	plant_received_water = 0;
	plant_received_sun = 0;
	
	
	// calculate metabolism parameters LMF and k_growth	
	_kc = my_id.genome[GEN.METABOLIC_RATE];
	_ka = my_id.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] * WORLD_WATER_PER_LEAF_KG;
	_LMFa = _kc/_ka
	
	
	ASSERT((_LMFa > 0 && _LMFa < 1), my_id, "Invalid LMFa="+string(_LMFa)+" creature "+string(my_id));  
	_LMFa = clamp(_LMFa, 0.01, 0.99);

	// translate to general Structure parameters
	_biomass_eat_allocation = _LMFa;



	// === do_metabolism
	// overrides do_metabolism to use photosyntesis
	// activates only at sim_month_entry
	// check age changes
	// increment biomass by anabolism
	// decrement biomass by catabolism
	// updates
	//		age
	//		is_dead, dead_cause
	//		is_adult
	//		is_starving
	//		biomass
	//		_biomass_max
	//		world.biomass		<---??
	//		plant_received_water = 0
	//		plant_received_sun = 0
	
	do_metabolism = function() {
	
		// can not do this at initialization
		if _first_execution {
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_ka", _ka);
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_kc", _kc);
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_LMFa", _LMFa);
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Topt1", _Topt1);
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Topt2", _Topt2);
			log_event(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Tmin", _Tmin);
			_first_execution = false;
			
			// initial biomass allocation
			_biomass_max = biomass;
			_biomass_reserve_max = _biomass_max * my_id.genome[GEN.ALLOCATION_RESERVE];
			biomass_reserve = biomass - (_biomass_max - _biomass_reserve_max);
						biomass_allocation(my_id);
			if age_is_adult {
				log_event(LOGEVENT.CREATURE_LIFE_EVENT, my_id, "spawn_as_adult", "biomass: "+string(biomass));
			}

		}
		else {
	
			// plants use a longer cycle	
	
			if controller.time.sim_month_entry {


					log_event(LOGEVENT.CREATURE_WATER_RECEIVED, my_id, plant_received_water);
					log_event(LOGEVENT.CREATURE_TEMPERATURE, my_id, my_id.my_cell.temperature_current_month);
					log_event(LOGEVENT.CREATURE_RAIN, my_id, my_id.my_cell.rain_current_month);



					// -- ANABOLISM
						
					// we expect to have received water: biomass_eat*WORLD_WATER_PER_LEAF_KG
					// we are going to use it for compensate catabolism + growth + reserves
				
					var _quant_anabolism = plant_received_water * my_id.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L];
				
					// temperature affects anabolism. under Tmin or over _Topt2 anabolism stops.
					var _temp_factor = my_id.my_cell.temperature_current_month > _Topt2 
								? 0 
								: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, 1);
					_quant_anabolism *= _temp_factor;
					
					log_event(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "received water: "+string(plant_received_water)+", T:" + string(my_id.my_cell.temperature_current_month)+", kt: "+string(_temp_factor));
					plant_received_water = 0;
				
				
				
					// -- CATABOLISM

					// catabolims depends only on biomass_body
					var _quant_catabolism = _kc * biomass_body
					log_event(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism);

					// -- change biomass

					biomass_modify (my_id, _quant_anabolism - _quant_catabolism);
				

				}
		}
				  
						
	}
	

	

}