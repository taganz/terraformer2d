// add creature to a cell without changing statistics. create cell if it doesn't exist yet 
// return new cell or -1 if error
function _cell_add_creature (_id, _x_cell, _y_cell) {
			
	with controller.world {
		
			// check if cell already exist and creat it if not
			var cell = ds_grid_get(grid_cells, _x_cell, _y_cell);
			
			if is_undefined(cell) {
				ASSERT(false, _id, "_cell_add_creature invalid cell position "+string(_id.x)+", "+string(_id.y));
				return -1;
			}
			
			// if there is still no cell at position create one
			if cell == 0 {
				_grid_create_cell(_x_cell, _y_cell)
			}

			// add creature to cell;
			switch( _id.genome[GEN.TROPHIC_LEVEL]) {
				case TROPHIC_LEVEL.PRODUCER:
					if _id.genome[GEN.BIOMASS_ADULT] > BIOMASS_ADULT_BIG_THRESHOLD 
						ds_list_add(grid_cells[# _x_cell, _y_cell].list_producers_big, _id);
					else
						ds_list_add(grid_cells[# _x_cell, _y_cell].list_producers_small, _id);
					break;
				case TROPHIC_LEVEL.PRIMARY:
					ds_list_add(grid_cells[# _x_cell, _y_cell].list_primaries, _id);
				break;
				case TROPHIC_LEVEL.SECONDARY:
					ds_list_add(grid_cells[# _x_cell, _y_cell].list_secondaries, _id);
				break;
				default:
					ASSERT(false, _id, "_cell_add_creature invalid trophic level");
					return -1;
			}
			
			return grid_cells[# _x_cell, _y_cell];
	}		
		
}