
//TO BE REVIEWED

	// === do_metabolism    
	// uses photosyntesis
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
	//		plant_roots_absorbed_water = 0
	//		plant_received_sun = 0
	
	
function structure_metabolism_plant(my_id){
	
	with my_id.structure {
		
		// plants use a longer cycle	
	
		if controller.time.sim_month_entry {


				log_event(LOGEVENT.CREATURE_WATER_RECEIVED, my_id, plant_roots_absorbed_water);
				log_event(LOGEVENT.CREATURE_TEMPERATURE, my_id, my_id.my_cell.temperature_current_month);
				log_event(LOGEVENT.CREATURE_RAIN, my_id, my_id.my_cell.rain_current_month);
				log_event(LOGEVENT.CREATURE_CELL_PLANTS_AVAILABLE_WATER, my_id, my_id.my_cell.plants_available_water);
								


				// -- ANABOLISM
						
				// we expect to have received water: biomass_eat*WORLD_WATER_PER_LEAF_KG
				// we are going to use it for compensate catabolism + growth + reserves
				
				var _quant_anabolism = plant_roots_absorbed_water * my_id.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L];
				
				// temperature affects anabolism. under Tmin or over _Topt2 anabolism stops.
				var _anabolism_temperature_factor = my_id.my_cell.temperature_current_month > _Topt2 
							? 0 
							: clamp((my_id.my_cell.temperature_current_month - _Tmin)/(_Topt1-_Tmin), 0, 1);
				_quant_anabolism *= _anabolism_temperature_factor;
					
				log_event(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism, "received water: "+string(plant_roots_absorbed_water)+", T:" + string(my_id.my_cell.temperature_current_month)+", kt: "+string(_anabolism_temperature_factor));
				plant_roots_absorbed_water = 0;
				
				
				
				// -- CATABOLISM
				// MIN(biomass / TIME STEP, dna metabolic rate*biomass body * (0.9 * temp factor+0.1))

				// catabolims depends on biomass_body and temperature
				// temp_factor is used to simulate dormancy
				var _catabolism_temperature_factor =  clamp(
									my_id.genome[GEN.DORMANCY_CATABOLISM_REDUCTION]
									* (my_id.my_cell.temperature_current_month - _Tmin)
									/ (_Topt1-_Tmin)
									+ 1 - my_id.genome[GEN.DORMANCY_CATABOLISM_REDUCTION] 
									, 0, 1);
				var _quant_catabolism = my_id.genome[GEN.KC_METABOLIC_RATE] * biomass_body * _catabolism_temperature_factor;
				log_event(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism,
						"T:" + string(my_id.my_cell.temperature_current_month)+", Kctf: "+string(_catabolism_temperature_factor));

				// -- change biomass

				biomass_modify (my_id, _quant_anabolism - _quant_catabolism);
				

			}
	}

}