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
		
			// add water
			var water = climate_rain(cell.climate, controller.time.current_sim_month);
			cell.available_water = water < cell.soil_available_water_max ? water : cell.soil_available_water_max;
			
			// cell coordenates
			cell.x_cell = _x_cell;
			cell.y_cell = _y_cell;
		}
		
	}
	
	
}