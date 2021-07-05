// update available water and sun for plants of active cells depending on plant height, soil type and climate
// out
//		cell producers.anabolism_input: 
//		cell.stored_water
//		cell.temperature_current_month
//		cell.rain_current_month
function grid_do_rain() {

	with controller.world {
		
		// for all cells in the grid
		
		for (var i=0; i< ds_grid_width(grid_cells); i++) {
			for (var j=0; j< ds_grid_height(grid_cells); j++) {
				
				var _cell = grid_cells[# i, j];
				
				// process only initialized cells
				
				if _cell!= 0 {
						
					// === update cell water status
						
					// process water losses
					
					_cell.stored_water = max( 0, _cell.stored_water - _cell.losses_per_month_kg);
					
					// update temperature						
					
					_cell.temperature_current_month = climate_temperature(_cell.climate, controller.time.current_sim_month);	
						
					// update rain. 
					
					_cell.rain_current_month = climate_rain(_cell.climate, controller.time.current_sim_month);
					
					// log this month rain and temperature for this cell
					
					if _cell.probe_logging
						log_event(LOGEVENT.WORLD_PROBE_RAIN_TEMP, _cell); 
					
					
					// update stored water with rain. soil can absorb only water up to saturation level
					// climate_rain units is mm, convert to kg
					
					_cell.stored_water = min(_cell.rain_current_month * CELL_AREA + _cell.stored_water, _cell.soil_saturation_water_kg); // <--- precalculate;	
					
					
					// water available to plants depend on field capacity and permanent wilting point
					
					_cell.plants_available_water = soil_plant_available_water(_cell.stored_water, _cell.soil_field_capacity_kg, _cell.soil_permanent_wilting_point_kg);
					

					// reorder producers list if producer height changes occurred
					
					if _cell.grid_producers_need_sort {
						ds_grid_sort(_cell.grid_producers, 1, false);		// descending height
					}
					
					// === distribute water among producers - first the TALL ones, they receive the light
					
					var previous_root_depth = SOIL_DEPTH_MM;
					
					for (var c=0; c < CELL_MAX_PRODUCERS 
									and _cell.grid_producers[# 0, c] != 0		// producer id
									and _cell.plants_available_water > 0
									; c++) {
										
						var producer_id = _cell.grid_producers[# 0, c];
								
						// water quantity producer is asking for
		
						var _plant_transpiration =
									producer_id.structure.biomass_eat * LEAF_M2_PER_KG 
									* climate_ET0_evotranspiration(_cell.climate, controller.time.current_sim_month)
									* producer_id.genome[GEN.EVOTRANSPIRATION_FACTOR]; 
										
						// water available to plant is the part of PAW up to roots depth * factor 
						
						var plant_root_depth_mm = producer_id.structure.my_height / PRODUCERS_MAX_HEIGHT * SOIL_DEPTH_MM * producer_id.genome[GEN.ROOT_HEIGHT_RATIO];
				
				
						// calculate available water at root depth
				
						var _PAW_at_root_depth = plant_root_depth_mm / SOIL_DEPTH_MM * _cell.plants_available_water;
						_PAW_at_root_depth = clamp(_PAW_at_root_depth, 0, _cell.plants_available_water);
						
						// get maximum asked water if available
				
						var _quant_water = clamp(_plant_transpiration,0, _PAW_at_root_depth);
						_quant_water = clamp(_quant_water, 0, _cell.stored_water);
							
						// give to producer
						
						producer_id.structure.anabolism_input = _quant_water; // don't accumulate water from previous month
						
						// log available water to plant
						
						if _cell.probe_logging {
							log_event(LOGEVENT.WORLD_PROBE_PLANT_AVAILABLE_WATER, producer_id, _plant_transpiration, c, _PAW_at_root_depth);
						}
						
						// substract used water and recalculate plant available water
						
						_cell.stored_water -= _quant_water;
						_cell.plants_available_water = soil_plant_available_water(_cell.stored_water, _cell.soil_field_capacity_kg, _cell.soil_permanent_wilting_point_kg);
					
						// water beyond this point will be lost (producers are sorted by height-root)
						
						previous_root_depth = plant_root_depth_mm;
						

								
						// no more water to give
						//if _cell.plants_available_water <= 0 
						//	break;
								
						
					}
				}
			}
		}
	}
}
