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

/*

	// decrement nutrient in the cell and return obtained value
	nutrients_eaten = function (_nutrient, _quant_wanted, _x, _y) {
		var _quant_got =  grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE].map_nutrients[? _nutrient];
		ASSERT(is_undefined(_quant_got)==false, 0, "world.nutrients_eaten error getting nutrient "+string(_nutrient)+ " at "+string(_x)+","+string(_y));
		if _quant_got > _quant_wanted {
			_quant_got = _quant_wanted;
		}
		grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE].map_nutrients[? _nutrient] -= _quant_got;
		return _quant_got;
	}

*/

/*
	// return nutrients in the cell	
	get_nutrients_2 = function (_nutrient, _x, _y) {
		var _cell = grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE];
		return _cell == 0 ? 0 : _cell.map_nutrients[? _nutrient];
	}

*/

/*
	// return available water in cell	
	get_water = function (_x, _y) {
		var _cell = grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE];
		return _cell == 0 ? 0 : _cell.available_water;
	}
*/	


	


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