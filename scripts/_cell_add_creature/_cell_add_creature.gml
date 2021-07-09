// return new creature's cell or -1 if error

function _cell_add_creature (_id, _x_cell, _y_cell) {
			
	with controller.world {
		
			// get world cell
			
			var cell = ds_grid_get(grid_cells, _x_cell, _y_cell);
			
			if is_undefined(cell) {
				log_error(string(_id)+" _cell_add_creature invalid cell position "+string(_id.x)+", "+string(_id.y));
				return -1;
			}
			
			// create cell if still doesn't exists
			
			if cell == 0 {
				cell = _grid_create_cell(_x_cell, _y_cell);
				if cell == -1 {
					log_error(string(_id)+" _cell_add_creature error creating cell "+string(_x_cell)+", "+string(_y_cell));
					return -1;
				}
			}

			// add creature to cell

			with cell {
				
				switch( _id.genome[GEN.TROPHIC_LEVEL]) {
					case TROPHIC_LEVEL.PRODUCER:
						if _grid_producers_current < CELL_MAX_PRODUCERS - 1 
							and family_cell_room_grid(_id, grid_producers) {
														
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

						if family_cell_room(_id, list_primaries) {
							ds_list_add(list_primaries, _id);
						}
						else {
							// no more room 
							return -1;  
						}

					break;
					case TROPHIC_LEVEL.SECONDARY:
						if family_cell_room(_id, list_secondaries) {
							ds_list_add(list_secondaries, _id);
						}
						else {
							// no more room 
							return -1;  
						}
					break;
					default:
						ASSERT(false, _id, "_cell_add_creature invalid trophic level");
						return -1;
				}
			}
			

			return cell;
	}		
		
}