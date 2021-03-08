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
	
	// return nutrients in the cell	
	get_nutrients_2 = function (_nutrient, _x, _y) {
		var _cell = grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE];
		return _cell == 0 ? 0 : _cell.map_nutrients[? _nutrient];
	}

	// return available water in cell	
	get_water = function (_x, _y) {
		var _cell = grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE];
		return _cell == 0 ? 0 : _cell.available_water;
	}
	


	// return list of creatures in 9 cells. try first same cell
	// assumes that calling creature is at _x, _y 
	get_creatures_close_cells = function(_x, _y, kind) {
		ASSERT(kind == "big" or kind = "small", 0, "get_creatures_close_cells invalid parameter kind="+string(kind));
		
		//var _msg = "";
		var _xx = _x div CELL_SIZE;
		var _yy = _y div CELL_SIZE;
		
		// try first same cell
		if kind == "small" 
			var _list = grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE].list_producers_small;
		else
			var _list = grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE].list_producers_big;
		
		
		if ds_list_size(_list) == 1 {			// 1 it's me

			//show_debug_message("I'm alone in my cell - "+string(_list[| 0].id));
			// chose first cell at random to avoid everybody moving in the same direction to eat
			var i1 = choose(4, 5, 6);
			var j1 = choose(4, 5, 6);
			for (var i = i1; i < i1 +3; i++) {
				for (var j = j1; j < j1+3; j++) {
					var _xx_check = _xx + (i mod 3) -1;
					var _yy_check = _yy + (j mod 3) -1;
					
					if is_inside_world_cell(_xx_check, _yy_check) {
						//_msg += string(_xx_check) + ", "+string(_yy_check)+" - ";
					
						// check if there is a initialized cell. if so, get list_creatures
						var _cell = grid_cells[# _xx_check, _yy_check];
						if _cell!= 0 {						
							if kind == "small" 
								_list = _cell.list_producers_small;
							else
								_list = _cell.list_producers_big;
							if ds_list_empty(_list)
								break;
						}
					}
				}
			}
				
		
		}
		//show_debug_message("checked: "+_msg);
		return _list;

	}
	
	
	// create a cell at pixel position
	grid_create_cell_pixel = function(_x, _y) {
		ASSERT(is_inside_world(_x, _y), 0, "grid_create_cell_pixel");
		grid_create_cell(_x div CELL_SIZE, _y div CELL_SIZE);
	}
	
	// create a cell at grid position
	grid_create_cell = function(_x_cell, _y_cell) {
		// check if cell already exists
		if grid_cells[# _x_cell, _y_cell]==0 {
			// create cell
			ds_grid_add(grid_cells, _x_cell, _y_cell, new Cell())
			cell = ds_grid_get(grid_cells, _x_cell, _y_cell);
				
			// add nutrients to cell
			var layer_nutrients = layer_get_id(LAYER_NUTRIENTS);
			var map_nutrients = layer_tilemap_get_id(layer_nutrients);
			var tile_data = tilemap_get_at_pixel(map_nutrients, _x_cell * CELL_SIZE, _y_cell * CELL_SIZE);   // <--- TBC
			var nutrients_at_tile = tile_get_index(tile_data) * kg_to_units(NUTRIENT_TILE_MULTIPLIER) + kg_to_units(NUTRIENT_TILE_OFFSET);
			cell.map_nutrients[? NUTRIENT.MINERAL] = nutrients_at_tile;
		
			// load climate from tileset
			var layer_climate = layer_get_id(LAYER_CLIMATE);
			var map_climate = layer_tilemap_get_id(layer_climate);
			var tile_data = tilemap_get_at_pixel(map_climate, _x_cell*CELL_SIZE, _y_cell*CELL_SIZE);
			var climate_at_tile= tile_get_index(tile_data);
			cell.climate = climate_at_tile;
		
			// add water
			var water = climate_rain(cell.climate, controller.time.current_sim_month);
			cell.available_water = water < cell.soil_available_water_max ? water : cell.soil_available_water_max;
			
			// cell coordenates
			cell.x_cell = _x_cell;
			cell.y_cell = _y_cell;
		}
		
	}
	
	

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
	
	



	// is this point inside the window?
	
	is_inside_world = function (_x, _y) {
		return _x >= 0 && _y >= 0 && _x < world_max_x && _y < world_max_y;
	}

	is_inside_world_cell = function (_xx_check, _yy_check) {
		return _xx_check >= 0 && _yy_check >= 0 && _xx_check < world_w && _yy_check < world_h;
	}

	// radiation at a point

	get_radiation = function(_x, _y) {
		return SIMULATION_WORLD_RADIATION;
	}

}