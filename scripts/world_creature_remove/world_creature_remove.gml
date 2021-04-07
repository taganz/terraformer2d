
function world_creature_remove(_id) {
	
	with controller.world {

		var xx = floor(_id.x/CELL_SIZE_PX);
		var yy = floor(_id.y/CELL_SIZE_PX)
		var cell = ds_grid_get(grid_cells, xx, yy);
		if cell >0 {
			var pos_in_list = ds_list_find_index(cell.list_dead_creatures, _id );
			ASSERT(pos_in_list != -1, _id, "world.creature_remove error pos_in_list for creature "+string(_id)+" at "+string(_id.x)+","+string(_id.y));
			if pos_in_list != -1 {
					ds_list_delete(grid_cells[# xx, yy].list_dead_creatures, pos_in_list);
			}
		}

	}

}