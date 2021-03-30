// update available water and sun for plants of active cells depending on soil type and climate
// first to big producers, then to the small ones
// in
//		time, rain depends on current month
//		cell.climate, rain depends on climate
//		cell.soil_max_stored_water
//		cell.creatures.biomass_eat
// out
//		cell.stored_water
//		cell.creature.plant_received_water: 
//		cell.creature.plant_received_sun: 1 <---	
function grid_update_cells_water() {

	with controller.world {
		
		// for all cells 
		
		for (var i=0; i< ds_grid_width(grid_cells); i++) {
			for (var j=0; j< ds_grid_height(grid_cells); j++) {
				var _cell = grid_cells[# i, j];
				
				// if cell is initialized
				
				if _cell!= 0 {
						
						
					// process water losses
					
					_cell.stored_water = max( 0, _cell.stored_water - (_cell.water_infiltration_month + _cell.water_evaporation_month) );		// <-- precalculate
					
					// update temperature						
					
					_cell.temperature_current_month = climate_temperature(_cell.climate, controller.time.current_sim_month);	
						
					// update rain. 
					
					_cell.rain_current_month = climate_rain(_cell.climate, controller.time.current_sim_month);
					
					// update stored water with rain. soil can absorb only water up to max_stored_water
					// climate_rain units is mm, convert to kg
					
					_cell.stored_water = min(_cell.rain_current_month * CELL_SIZE_REAL * CELL_SIZE_REAL + _cell.stored_water, _cell.soil_max_stored_water); // <--- precalculate;	
					
					
					// water available to plants depend on field capacity and permanent wilting point
					
					_cell.plant_available_water = _cell.stored_water > _cell.soil_max_stored_water * _cell.soil_field_capacity ? 
													_cell.soil_max_stored_water * (_cell.soil_field_capacity - _cell.soil_permanent_wilting_point) :
													max(0, _cell.stored_water - _cell.soil_max_stored_water * _cell.soil_permanent_wilting_point);


					// distribute water among producers - first the TALL ones, they receive the light
					
					for (var c=0; c < ds_list_size(_cell.list_producers_big);c++) {
							var producer_id = _cell.list_producers_big[|c];
								
							// give water to plant 
							var _quant_water = clamp(producer_id.structure.biomass_eat*WORLD_WATER_PER_LEAF_KG, 0, _cell.plant_available_water);
							producer_id.structure.plant_received_water += _quant_water;
							_cell.plant_available_water -= _quant_water;
							_cell.stored_water -= _quant_water;
								
							// updates solar energy received
							producer_id.structure.plant_received_sun = 1;
								
							// no more water to give
							if _cell.plant_available_water <= 0 
								break;
								
					}
					
					// if there is still some water distribute among SMALL producers
					
					if _cell.plant_available_water > 0 {
						
						for (var c=0; c < ds_list_size(_cell.list_producers_small);c++) {
								var producer_id = _cell.list_producers_small[|c];
								
								// give water to creature 
								var _quant_water = clamp(producer_id.structure.biomass_eat*WORLD_WATER_PER_LEAF_KG, 0, _cell.plant_available_water);
								producer_id.structure.plant_received_water += _quant_water;
								_cell.plant_available_water -= _quant_water;
								_cell.stored_water -= _quant_water;
								
								// updates solar energy received
								producer_id.structure.plant_received_sun = 1;
								
								// no more water to give
								if _cell.plant_available_water == 0 
									break;
								
							
						}
					}
				}
			}
		}
	}
}
