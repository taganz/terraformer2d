// update available water and sun for plants of active cells depending on soil type and climate
// first to big producers, then to the small ones
// in
//		time, rain depends on current month
//		cell.climate, rain depends on climate
//		cell.soil_available_water_max
//		cell.creatures.biomass_eat
// out
//		cell.available_water
//		cell.creature.plant_received_water: 
//		cell.creature.plant_received_sun: 1 <---	
function rain() {

	with controller.world {
		
		// for all cells 
		
		for (var i=0; i< ds_grid_width(grid_cells); i++) {
			for (var j=0; j< ds_grid_height(grid_cells); j++) {
				var _cell = grid_cells[# i, j];
				
				// if cell is initialized
				
				if _cell!= 0 {
						
					// update temperature						
					
					_cell.temperature_current_month = climate_temperature(_cell.climate, controller.time.current_sim_month);	
						
					// update available water with rain
					
					var _rain = climate_rain(_cell.climate, controller.time.current_sim_month);	
					_cell.rain_current_month = _rain;
					_cell.available_water = ((_rain + _cell.available_water) < _cell.soil_available_water_max) 
								? _cell.available_water + _rain 
								: _cell.soil_available_water_max;

					// distribute water among producers - first the TALL ones, they receive the light
					
					for (var c=0; c < ds_list_size(_cell.list_producers_big);c++) {
							var producer_id = _cell.list_producers_big[|c];
								
							// give water to creature 
							var _quant_water = clamp(producer_id.structure.biomass_eat*WORLD_WATER_PER_LEAF_KG, 0, _cell.available_water);
							producer_id.structure.plant_received_water += _quant_water;
							_cell.available_water -= _quant_water;
								
							// updates solar energy received
							producer_id.structure.plant_received_sun = 1;
								
							// no more water to give
							if _cell.available_water == 0 
								break;
								
					}
					
					// if there is still some water distribute among SMALL producers
					
					if _cell.available_water > 0 {
						
						for (var c=0; c < ds_list_size(_cell.list_producers_small);c++) {
								var producer_id = _cell.list_producers_small[|c];
								
								// give water to creature 
								var _quant_water = clamp(producer_id.structure.biomass_eat*WORLD_WATER_PER_LEAF_KG, 0, _cell.available_water);
								producer_id.structure.plant_received_water += _quant_water;
								_cell.available_water -= _quant_water;
								
								// updates solar energy received
								producer_id.structure.plant_received_sun = 1;
								
								// no more water to give
								if _cell.available_water == 0 
									break;
								
							
						}
					}
				}
			}
		}
	}
}
