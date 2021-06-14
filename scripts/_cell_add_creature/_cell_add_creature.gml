// add creature to a cell without changing statistics.
// create cell if it doesn't exist yet 
// return new cell or -1 if error
function _cell_add_creature (_id, _x_cell, _y_cell) {
			
	with controller.world {
		
			// check if cell already exist and create it if not
			var cell = ds_grid_get(grid_cells, _x_cell, _y_cell);
			
			if is_undefined(cell) {
				ASSERT(false, _id, "_cell_add_creature invalid cell position "+string(_id.x)+", "+string(_id.y));
				return -1;
			}
			
			// if there is still no cell at position create one
			if cell == 0 {
				_grid_create_cell(_x_cell, _y_cell)
			}

			with grid_cells[# _x_cell, _y_cell] {
				
				// add creature to cell;
				switch( _id.genome[GEN.TROPHIC_LEVEL]) {
					case TROPHIC_LEVEL.PRODUCER:
						if _grid_producers_current < CELL_MAX_PRODUCERS - 1 {
							grid_producers[# 0, _grid_producers_current] = _id;
							//ASSERT(_id.structure.my_height>0, _id, "_cell_add_creature heigth==0");  // can not have 0 heigth in grid producers
							grid_producers[# 1, _grid_producers_current] = _id.structure.my_height;
							grid_producers_need_sort = true;
							_grid_producers_current++;
						}
					
						else {
							// no more room for producers
							return -1;
						}
						break;
					case TROPHIC_LEVEL.PRIMARY:
						ds_list_add(list_primaries, _id);
					break;
					case TROPHIC_LEVEL.SECONDARY:
						ds_list_add(list_secondaries, _id);
					break;
					default:
						ASSERT(false, _id, "_cell_add_creature invalid trophic level");
						return -1;
				}
			}
			
			return grid_cells[# _x_cell, _y_cell];
	}		
		
}