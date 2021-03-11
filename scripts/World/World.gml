/*
	World (constructor)
	
*/



function World() constructor {
	
	// === intialize vars

	// grid_nutrients
	// grid_cells
	// statistics

#region Initialize vars

	climate_change_temperature_increment = 0;		// used by GUI to simulate climate change

	world_max_x = window_get_width();
	world_max_y = window_get_height();
	
	world_w = floor(world_max_x/CELL_SIZE);
	world_h = floor(world_max_y/CELL_SIZE);
	grid_cells = ds_grid_create(world_w+1, world_h+1);
	
	// stats
	creatures_live_now = 0;
	creatures_dead = 0;
	creatures_born = 0;
	creatures_peak = 0;
	trophic_level_live_now = [];
	biomass = 0;
	
	trophic_level_live_now[TROPHIC_LEVEL.PRODUCER]=0;
	trophic_level_live_now[TROPHIC_LEVEL.PRIMARY]=0;
	trophic_level_live_now[TROPHIC_LEVEL.SECONDARY]=0;
	
	climates = [];
	climates = climate_read_array();
	
	radiation = SIMULATION_WORLD_RADIATION;
	
#endregion



	


	// simulating decomposers tranforming corpse into organic nutrients
	biomass_decomposition = function (_id) {
		
		// calculate how much biomass is about to be decomposed
		var _decomp = _id.structure.biomass * BIOMASS_DECOMPOSITION_FACTOR;
		
		if (_id.structure.biomass - _decomp < BIOMASS_DECOMPOSITION_ZERO)    // too small, go to zero
			_decomp = _id.structure.biomass;
				
		biomass_modify(_id, -_decomp);
		
			
		// transform this biomass into organic nutrients
		grid_cells[# _id.x div CELL_SIZE, _id.y div CELL_SIZE].map_nutrients[? NUTRIENT.MINERAL] += _decomp;
		
		return _decomp;
	}
	


}