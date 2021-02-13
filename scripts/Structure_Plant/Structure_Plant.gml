/*

	Structure_Plant

	
	
*/
#macro TEMPERATURE_DISTRIBUTION_MARGIN  5  // from Topt - margin to Topt + margin anabolims is optimum
function Structure_Plant(_id, _creature_spawn_as_adult):Structure(_id, _creature_spawn_as_adult) constructor {

	// this is sent by world cell for each plant cycle 
	//quant_water_wanted = kg_per_year_to_units(my_id.dna.genome[GEN.BIOMASS_WANTED_PER_YEAR_GROWTH])*TIME_SIM_STEPS_PER_MONTH;
	
	plant_received_water = 0;
	plant_received_sun = 0;

	// calculate metabolism parameters LMF and k_growth	
	_kc = my_id.dna.genome[GEN.METABOLIC_RATE];
	_ka = my_id.dna.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] * WORLD_WATER_PER_LEAF_KG;
	_LMFa = _kc/_ka
	// anabolism is affected by temperature linearly from 0 at Tmin and up to 1 at Topt
	_Topt1 = my_id.dna.genome[GEN.TEMPERATURE_OPTIMAL] - TEMPERATURE_DISTRIBUTION_MARGIN;
	_Topt2 = my_id.dna.genome[GEN.TEMPERATURE_OPTIMAL] + TEMPERATURE_DISTRIBUTION_MARGIN;
	_Tmin = _Topt1 - my_id.dna.genome[GEN.TEMPERATURE_RANGE_MINIMUM];
	ASSERT(_LMFa > 0 and _LMFa < 1, "Invalidad LMFa="+string(_LMFa)+" creature "+string(my_id));  
	//_growth = kg_to_units(my_id.dna.genome[GEN.GROWTH_KG_YR])/12;
	//_k_growth = _growth/_ka;


	biomass_leaf = biomass * _LMFa;
	biomass_trunk = biomass - biomass_leaf;

	biomass_reproductive = 0;			// doesn't change on plants
	biomass_reproductive_adult = 0;



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
	//		biomass_leaf
	//		biomass_trunk 
	//		world.biomass		<---??
	//		plant_received_water = 0
	//		plant_received_sun = 0
	
	do_metabolism = function() {
	
		// can not do this at initialization
		if _first_execution {
			LOG(LOGEVENT.INFO_CREATURE, my_id, "_ka: "+string(_ka));
			LOG(LOGEVENT.INFO_CREATURE, my_id, "_kc: "+string(_kc));
			LOG(LOGEVENT.INFO_CREATURE, my_id, "_LMFa: "+string(_LMFa));
			//LOG(LOGEVENT.INFO_CREATURE, my_id, "_growth: "+string(_growth));
			_first_execution = false;
		}

	
		// plants use a longer cycle	
	
		if controller.time.sim_month_entry {
			
	
			// -- age

			age += TIME_SIM_STEPS_PER_MONTH;
		
		
			// -- to old?
		
			if age > age_die {
				is_dead = true;
				dead_cause = DEADCAUSE.OLD;
			}
				
			// -- grown up?
			
			else {

				/*
				// -- grown up?
				if is_adult==false && age >= age_adult {
					is_adult = true;
					LOG(LOGEVENT.CREATURE_ADULT, my_id, "plant");
				}
*/
	
				// time for reproduction? 
				if is_adult_reproduction and age - age_last_reproduction > reproduction_interval {
					is_prepared_for_reproduction = true;
				}
	

				// -- ANABOLISM
				
				LOG(LOGEVENT.CREATURE_WATER_RECEIVED, my_id, plant_received_water);
				LOG(LOGEVENT.CREATURE_TEMPERATURE, my_id, my_id.my_cell.temperature_current_month);
				LOG(LOGEVENT.CREATURE_RAIN, my_id, my_id.my_cell.rain_current_month);
		
				// we expect to have received water: biomass_leaf*WORLD_WATER_PER_LEAF_KG
				// we are going to use it for compensate catabolism + growth
				
				var _quant_anabolism = plant_received_water * my_id.dna.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L];
				
				// temperature affects anabolism. under Tmin or over _Topt2 anabolism stops.
				var _temp_factor = my_id.my_cell.temperature_current_month > _Topt2 
							? 0 
							: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, 1);
				_quant_anabolism *= _temp_factor;
					
				LOG(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "received water: "+string(plant_received_water)+", temp factor: "+string(_temp_factor));
				plant_received_water = 0;
				
				
				
				// -- CATABOLISM
				
				var _quant_catabolism = _kc * biomass; // 12: conversion per year-per month
				LOG(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism);

				biomass_modify (_quant_anabolism - _quant_catabolism);
				
				
				// -- recalculate structure. check if arrived to adult

				if is_adult_growth 
					biomass_leaf = biomass * _LMFa;		
				else {
					//biomass_leaf = clamp(biomass * _LMFa + _k_growth, 0, biomass * 0.90);  // clamp prevents error for GROWTH target to big for current leaf biomass fraction
					
					
					if biomass > my_id.dna.genome[GEN.BIOMASS_ADULT]*0.9 {
						is_adult_growth = true;
						LOG(LOGEVENT.CREATURE_ADULT, my_id, "adult_growth");
						biomass_leaf = biomass * _LMFa;		
					}
					else {
						biomass_leaf = biomass *(_LMFa + (0.9 - _LMFa) * (1 - biomass / my_id.dna.genome[GEN.BIOMASS_ADULT]));
					}
					
				}
				biomass_trunk = biomass - biomass_leaf;
				biomass_reproductive = my_id.dna.genome[GEN.BIOMASS_BIRTH];   // fixed <----
			
			
				// can reproduce
				
				if biomass > my_id.dna.genome[GEN.BIOMASS_REPRODUCTION] {
					is_adult_reproduction = true;
					LOG(LOGEVENT.CREATURE_ADULT, my_id, "adult_reproduction");

				}

		
			}
				  
		}
						
	}
	

	

}