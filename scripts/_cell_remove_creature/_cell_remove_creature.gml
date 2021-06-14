// remove creature from cell without changing statistics
function _cell_remove_creature (_id, _x_cell, _y_cell) {
		
	with controller.world {
		
		// is there a cell at position?
		
		var cell = ds_grid_get(grid_cells, _x_cell, _y_cell);
		
		ASSERT(is_undefined(cell)== false, _id, "world.creature_dead invalid grid_cell coordinates ");
		if is_undefined(cell)
			return;
			
		ASSERT(cell!=0, _id, "_cell_remove_creature cell not found");		
		if cell == 0
			return;
		
		// is the creature in its list? delete it
		
		with cell {
		
			switch _id.genome[GEN.TROPHIC_LEVEL] {
				case TROPHIC_LEVEL.PRODUCER:
					// look for producer
					var row = ds_grid_value_y(grid_producers, 0, 0, 0, _grid_producers_current, _id);
					ASSERT(row != -1 or _id.structure.dead_cause==DEADCAUSE.BIRTH, _id, "_cell_remove_creature producer not found");
					if row != -1  {
						// delete row values
						grid_producers[# 0, row] = 0;				// reset creature id
						grid_producers[# 1, row] = -1;				// reset creature heigth 
						// sort to delete row
						ds_grid_sort(grid_producers, 1, false);		// descending height
						grid_producers_need_sort = false;			// just done
						// one less producer
						_grid_producers_current--;
					}
					else {
						if _id.structure.dead_cause!=DEADCAUSE.BIRTH
							var _breakpoint = 0;
					}
					break;
				case TROPHIC_LEVEL.PRIMARY:
					var pos_in_list = ds_list_find_index(list_primaries, _id);
					ASSERT(pos_in_list != -1, _id, "_cell_remove_creature primary not found");
					ds_list_delete(list_primaries, pos_in_list);
					break;
				case TROPHIC_LEVEL.SECONDARY:
					var pos_in_list = ds_list_find_index(list_secondaries, _id);
					ASSERT(pos_in_list != -1, _id, "_cell_remove_creature secondary not found");
					ds_list_delete(list_secondaries, pos_in_list);
					break;
			}
		}		
		/*
		switch _id.genome[GEN.TROPHIC_LEVEL] {
			case TROPHIC_LEVEL.PRODUCER:
				// look for producer
				var row = ds_grid_value_y(grid_cells[# _x_cell, _y_cell].grid_producers, 0, 0, 0, _grid_producers_current, _id);
				ASSERT(row != -1, _id, "_cell_remove_creature producer not found");
				if row != -1  {
					// delete row values
					grid_cells[# _x_cell, _y_cell].grid_producers[# row, 0] = 0;
					grid_cells[# _x_cell, _y_cell].grid_producers[# row, 1] = 0;
					// sort to delete row
					ds_grid_sort(grid_cells[# _x_cell, _y_cell].grid_producers, 2, false);		// descending height
					grid_cells[# _x_cell, _y_cell].grid_producers_need_sort = false;
					// one less producer
					_grid_producers_current = -1;
				}
				break;
			case TROPHIC_LEVEL.PRIMARY:
				var pos_in_list = ds_list_find_index(grid_cells[# _x_cell, _y_cell].list_primaries, _id);
				ASSERT(pos_in_list != -1, _id, "_cell_remove_creature primary not found");
				ds_list_delete(grid_cells[# _x_cell, _y_cell].list_primaries, pos_in_list);
				break;
			case TROPHIC_LEVEL.SECONDARY:
				var pos_in_list = ds_list_find_index(grid_cells[# _x_cell, _y_cell].list_secondaries, _id);
				ASSERT(pos_in_list != -1, _id, "_cell_remove_creature secondary not found");
				ds_list_delete(grid_cells[# _x_cell, _y_cell].list_secondaries, pos_in_list);
				break;
		}
		*/
	}
		
}
	