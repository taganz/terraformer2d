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
			var tile_data = tilemap_get_at_pixel(map_nutrients, _x_cell * CELL_SIZE_PX, _y_cell * CELL_SIZE_PX);   // <--- TBC
			var nutrients_at_tile = tile_get_index(tile_data) * (NUTRIENT_TILE_MULTIPLIER) + (NUTRIENT_TILE_OFFSET);
			cell.map_nutrients[? NUTRIENT.MINERAL] = nutrients_at_tile;
		
			// load climate from tileset
			var layer_climate = layer_get_id(LAYER_CLIMATE);
			var map_climate = layer_tilemap_get_id(layer_climate);
			var tile_data = tilemap_get_at_pixel(map_climate, _x_cell*CELL_SIZE_PX, _y_cell*CELL_SIZE_PX);
			var climate_at_tile= tile_get_index(tile_data);
			cell.climate = climate_at_tile;
		
			
			// cell coordenates
			cell.x_cell = _x_cell;
			cell.y_cell = _y_cell;
			
			// soil parameters
			//    at present, each climate has a specific soil type
			cell.soil_type = climate_get_soil(cell.climate);
			
						
			// max stored water
			cell.soil_saturation_water_kg = soil_saturation_water_kg(cell.soil_type); 
			cell.soil_field_capacity_kg = soil_get_field_capacity(cell.soil_type) * CELL_AREA * SOIL_DEPTH_MM;  //  kg = % * m2 * mm * 1 kg/m2/mm				
			cell.soil_permanent_wilting_point_kg = soil_get_permanent_wilting_point(cell.soil_type) * CELL_AREA * SOIL_DEPTH_MM; // kg 
			
			cell.losses_per_month_kg = soil_get_losses_rate(cell.climate, cell.soil_type) * CELL_AREA ;   // kg = mm/month * m2 * 1kg/m2/mm
			
			// initial water = saturation / 2			
			cell.stored_water = cell.soil_saturation_water_kg / 2;
		}
		
	}
	
	
}