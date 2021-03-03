/*

	Structure_Plant

	
	
*/
#macro TEMPERATURE_DISTRIBUTION_MARGIN  2  // from Topt - margin to Topt + margin anabolims is optimum
function Structure_Plant(_id, _creature_spawn_as_adult):Structure(_id, _creature_spawn_as_adult) constructor {

	// this is sent by world cell for each plant cycle 
	//quant_water_wanted = kg_per_year_to_units(my_id.dna.genome[GEN.BIOMASS_WANTED_PER_YEAR_GROWTH])*TIME_SIM_STEPS_PER_MONTH;
	
	plant_received_water = 0;
	plant_received_sun = 0;

	// calculate metabolism parameters LMF and k_growth	
	_kc = my_id.dna.genome[GEN.METABOLIC_RATE];
	_ka = my_id.dna.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] * WORLD_WATER_PER_LEAF_KG;
	_LMFa = _kc/_ka
	
	// anabolism is affected by a temperature coefficient
	//  - below Tmin:  kt = 0
	//	- range Tmin - Topt1:  kt =  grow linearly from 0 to 1
	//  - range Topt1 - Topt2: kt = 1 
	//	- above Topt2: kt = 0
	_Topt2 = my_id.dna.genome[GEN.TEMPERATURE_OPTIMAL] + my_id.dna.genome[GEN.TEMPERATURE_RANGE];
	_Topt1 = my_id.dna.genome[GEN.TEMPERATURE_OPTIMAL];
	_Tmin  = my_id.dna.genome[GEN.TEMPERATURE_OPTIMAL] - my_id.dna.genome[GEN.TEMPERATURE_RANGE];
	
	ASSERT((_LMFa > 0 && _LMFa < 1), my_id, "Invalid LMFa="+string(_LMFa)+" creature "+string(my_id));  
	_LMFa = clamp(_LMFa, 0.01, 0.99);
	
	// initial biomass allocation
	biomass_eat = biomass * _LMFa;
	biomass_body = biomass - biomass_eat;


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
	//		biomass_max
	//		world.biomass		<---??
	//		plant_received_water = 0
	//		plant_received_sun = 0
	
	do_metabolism = function() {
	
		// can not do this at initialization
		if _first_execution {
			LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_ka", _ka);
			LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_kc", _kc);
			LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_LMFa", _LMFa);
			LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Topt1", _Topt1);
			LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Topt2", _Topt2);
			LOG(LOGEVENT.CREATURE_BORN_INFO_NUM, my_id, "_Tmin", _Tmin);
			_first_execution = false;
		}

	
		// plants use a longer cycle	
	
		if controller.time.sim_month_entry {


				LOG(LOGEVENT.CREATURE_WATER_RECEIVED, my_id, plant_received_water);
				LOG(LOGEVENT.CREATURE_TEMPERATURE, my_id, my_id.my_cell.temperature_current_month);
				LOG(LOGEVENT.CREATURE_RAIN, my_id, my_id.my_cell.rain_current_month);



				// -- ANABOLISM
						
				// we expect to have received water: biomass_eat*WORLD_WATER_PER_LEAF_KG
				// we are going to use it for compensate catabolism + growth + reserves
				
				var _quant_anabolism = plant_received_water * my_id.dna.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L];
				
				// temperature affects anabolism. under Tmin or over _Topt2 anabolism stops.
				var _temp_factor = my_id.my_cell.temperature_current_month > _Topt2 
							? 0 
							: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, 1);
				_quant_anabolism *= _temp_factor;
					
				LOG(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "received water: "+string(plant_received_water)+", T:" + string(my_id.my_cell.temperature_current_month)+", kt: "+string(_temp_factor));
				plant_received_water = 0;
				
				
				
				// -- CATABOLISM

				// catabolims depends only on biomass_body
				var _quant_catabolism = _kc * biomass_body
				LOG(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism);

				// -- change biomass

				biomass_modify (my_id, _quant_anabolism - _quant_catabolism);
				

			}
				  
						
	}
	

	

}