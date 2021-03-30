// create a cell at grid position
function _grid_create_cell(_x_cell, _y_cell) {


	with controller.world {
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
		
			
			// cell coordenates
			cell.x_cell = _x_cell;
			cell.y_cell = _y_cell;
			
			// soil parameters
				
			cell.soil_type = SOIL.DEFAULT;
			cell.soil_max_stored_water = soil_max_stored_water(cell.soil_type); 
			cell.soil_field_capacity = soil_get_field_capacity(cell.soil_type);				
			cell.soil_permanent_wilting_point = soil_get_permanent_wilting_point(cell.soil_type);
			
			cell.water_infiltration_month = 2 * CELL_SIZE_REAL * CELL_SIZE_REAL;		// --> should depend on soil...?
			cell.water_evaporation_month = 2 * CELL_SIZE_REAL * CELL_SIZE_REAL;		// --> should depend on soil and temperature... ?  -- depends also on plants!!
	
			// add water
			var water = climate_rain(cell.climate, controller.time.current_sim_month);
			cell.stored_water = min(water, cell.soil_max_stored_water);
	
		}
		
	}
	
	
}