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


	//biomass_decomposition_factor = BIOMASS_DECOMPOSITION_FACTOR;

	// update water and sun for plants of active cells depending on soil type and climate
	rain = function() {
		// update available water and sun for plants of active cells depending on soil type and climate
		// in
		//		time, rain depends on current month
		//		cell.climate, rain depends on climate
		//		cell.soil_available_water_max
		//		cell.creatures.biomass_eat
		// out
		//		cell.available_water
		//		cell.creature.plant_received_water: 
		//		cell.creature.plant_received_sun: 1 <---					// for all cells 
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

					// distribute water among producers
					for (var c=0; c < ds_list_size(_cell.list_creatures);c++) {
						var producer_id = _cell.list_creatures[|c];
						if producer_id.dna.genome[GEN.TROPHIC_LEVEL]==TROPHIC_LEVEL.PRODUCER  {
								
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
		
	// decrement nutrient in the cell and return obtained value
	nutrients_eaten = function (_nutrient, _quant_wanted, _x, _y) {
		var _quant_got =  grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE].map_nutrients[? _nutrient];
		assert(is_undefined(_quant_got)==false, "world.nutrients_eaten error getting nutrient "+string(_nutrient)+ " at "+string(_x)+","+string(_y));
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
	
	// get cell from pixel. 0 if not exists?
	get_cell = function(_x, _y) {
		return grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE];
	}

	// return list of creatures in this cell
	get_creatures_cell = function(_x, _y) {
		return grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE].list_creatures;
	}
	
	// return list of creatures in 9 cells. try first same cell
	// assumes that calling creature is at _x, _y 
	get_creatures_close_cells = function(_x, _y) {
		//var _msg = "";
		var _xx = _x div CELL_SIZE;
		var _yy = _y div CELL_SIZE;
		
		// try first same cell
		var _list = grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE].list_creatures;
		
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
						if _cell!= 0						
							_list = _cell.list_creatures;
							if ds_list_empty(_list)
								break;
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
	
	// add creature to a cell without changing statistics. create cell if it doesn't exist yet 
	_creature_add_to_cell = function (_id, _x_cell, _y_cell) {
			
			// check if cell already exist and creat it if not
			var cell = ds_grid_get(grid_cells, _x_cell, _y_cell);
			
			// if there is still no cell at position create one
			if cell == 0 {
				grid_create_cell(_x_cell, _y_cell)
			}

			// add creature to cell;
			ds_list_add(grid_cells[# _x_cell, _y_cell].list_creatures, _id);
			
			return grid_cells[# _x_cell, _y_cell];
			
	}
		
	// remove creature from cell without changing statistics
	_creature_remove_from_cell = function (_id, _x_cell, _y_cell) {
		
		// is there a cell at position?
		var cell = ds_grid_get(grid_cells, _x_cell, _y_cell);
		assert(is_undefined(cell)== false, "world.creature_dead invalid grid_cell coordinates "+string(_id));
		if cell!=0 {
				// is the creature in its list?
				var pos_in_list = ds_list_find_index(grid_cells[# _x_cell, _y_cell].list_creatures, _id);
				if pos_in_list != -1 {
						
					// remove creature from list
					ds_list_delete(grid_cells[# _x_cell, _y_cell].list_creatures, pos_in_list);
				}
				else {
						show_debug_message("*** WARNING *** no creature in _creature_remove_from_cell: "+string(_id)+": "+string(_x_cell)+","+string(_y_cell));
				}
		}
		else {
			show_debug_message("*** WARNING *** no cell in _creature_remove_from_cell: "+string(_id)+": "+string(_x_cell)+","+string(_y_cell));
		}
	}
	
	// add creature to grid_cells at cell corresponding to pixels _x, _y
	creature_born = function (_id, _x, _y)  {
		
		if is_inside_world(_x, _y) {
			
			var xx = floor(_x/CELL_SIZE);
			var yy = floor(_y/CELL_SIZE);
			
			var cell = _creature_add_to_cell (_id, xx, yy);
				
			// update stats
			creatures_live_now ++;
			trophic_level_live_now[_id.dna.genome[GEN.TROPHIC_LEVEL]]++;
			creatures_born ++;
			creatures_peak = creatures_peak <= creatures_live_now ? creatures_live_now : creatures_peak;

			LOG(LOGEVENT.CLIMATE_BORN, _id, climate_to_string(cell.climate));

		}
		else {
			show_debug_message("*** WARNING *** invalid x, y in creature_born: "+string(_id)+": "+string(_x)+","+string(_y));
			
			// instance_destroy   <--- TBC
			
		}

	}

	// change creature position and move it from cell if necessary
	creature_move = function (_id, _xTo, _yTo) {
	
		var _x_origin = _id.x;
		var _y_origin = _id.y;
		
		// change creature position
		_id.x = _xTo;
		_id.y = _yTo;
		
		// has changed cell?
		if (_x_origin div CELL_SIZE != _xTo div CELL_SIZE) 
			|| (_y_origin div CELL_SIZE != _yTo div CELL_SIZE) {
			
			// remove from old cell
			_creature_remove_from_cell(_id, _x_origin div CELL_SIZE, _y_origin div CELL_SIZE);
			
			// add to new cell
			_creature_add_to_cell (_id, _xTo div CELL_SIZE, _yTo div CELL_SIZE);
			}
	}

	// remove creature from list_creatures from grid_cells at cell corresponding to pixels _x, _y
	// add to list_dead_creatures
	creature_dead = function (_id) {
		
		var _x = _id.x;
		var _y = _id.y;
		
		// is position ok?
		if is_inside_world(_x, _y) {
			
			var xx = floor(_x/CELL_SIZE);
			var yy = floor(_y/CELL_SIZE);
			
			// remove from live creatures
			_creature_remove_from_cell (_id, xx, yy);
			
			// add to dead creatures
			ds_list_add(grid_cells[# xx, yy].list_dead_creatures, _id);
						
			// update stats
			creatures_live_now --;
			trophic_level_live_now[_id.dna.genome[GEN.TROPHIC_LEVEL]]--;
			creatures_dead ++;
			creatures_peak = creatures_peak <= creatures_live_now ? creatures_live_now : creatures_peak;

			// log
			controller.log.creature_dead(_id);
			
		}
		else {
			show_debug_message("*** WARNING *** invalid x, y in creature_dead: "+string(_id)+": "+string(_x)+","+string(_y));
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
	
	// remove from list_dead_creatures
	// to be called when a creature destroy its instance
	creature_remove = function (_id) {

		var xx = floor(_id.x/CELL_SIZE);
		var yy = floor(_id.y/CELL_SIZE)
		var cell = ds_grid_get(grid_cells, xx, yy);
		if cell >0 {
			//var pos_in_list = ds_list_find_index(grid_cells[# xx, yy].list_dead_creatures, _id );
			var pos_in_list = ds_list_find_index(cell.list_dead_creatures, _id );
			//assert(pos_in_list !=1, "world.creature_remove error pos_in_list for creature "+string(_id));
			//if pos_in_list == -1
			ASSERT(pos_in_list != -1, _id, "world.creature_remove error pos_in_list for creature "+string(_id)+" at "+string(_id.x)+","+string(_id.y));
			if pos_in_list != -1 {
					ds_list_delete(grid_cells[# xx, yy].list_dead_creatures, pos_in_list);
			}
		}

	}


	// return a string showing creatures and nutrients for cell corresponding to pixels _x, _y
	
	cell_to_string = function(_x, _y) {
		if is_inside_world(_x, _y) {
			var cell = ds_grid_get(grid_cells, floor(_x/CELL_SIZE), floor(_y/CELL_SIZE));
			var s = string(floor(_x/CELL_SIZE)) +","+ string(floor(_y/CELL_SIZE));
			// s = s + "\nbiomass_decomposition_factor: "+string(biomass_decomposition_factor);
			if (cell == 0)
				return s+": empty cell";
			else
				return s+":\n"+cell.to_string();
		}
		else {
			return "error x,y cell_to_string";
		}
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