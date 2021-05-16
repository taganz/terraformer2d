// remove creature from cell without changing statistics
function _cell_remove_creature (_id, _x_cell, _y_cell) {
		
	with controller.world {
		
		// is there a cell at position?
		
		var cell = ds_grid_get(grid_cells, _x_cell, _y_cell);
		ASSERT(is_undefined(cell)== false, _id, "world.creature_dead invalid grid_cell coordinates ");
		ASSERT(cell!=0, _id, "_cell_remove_creature cell not found");
		
		// is the creature in its list? delete it
		
		switch _id.genome[GEN.TROPHIC_LEVEL] {
			case TROPHIC_LEVEL.PRODUCER:
				if _id.genome[GEN.HEIGHT] > HEIGHT_PLANT_TRESHOLD {
					var pos_in_list = ds_list_find_index(grid_cells[# _x_cell, _y_cell].list_producers_big, _id);
					ASSERT(pos_in_list != -1, _id, "_cell_remove_creature big producer not found");
					ds_list_delete(grid_cells[# _x_cell, _y_cell].list_producers_big, pos_in_list);
				}
				else {
					var pos_in_list = ds_list_find_index(grid_cells[# _x_cell, _y_cell].list_producers_small, _id);
					ASSERT(pos_in_list != -1, _id, "_cell_remove_creature small producer not found");
					ds_list_delete(grid_cells[# _x_cell, _y_cell].list_producers_small, pos_in_list);
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
	}
		
}
	