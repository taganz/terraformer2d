
// remove creature from dead_creatures list

function world_creature_decomposed(_id) {
	
	with controller.world {

			var cell = _id.my_cell;
			if cell >0 {
				var pos_in_list = ds_list_find_index(cell.list_dead_creatures, _id );
				if pos_in_list != -1
					//ds_list_delete(grid_cells[# xx, yy].list_dead_creatures, pos_in_list);
					ds_list_delete(cell.list_dead_creatures, pos_in_list);
				}
				else {
					if  _id.structure.dead_cause != DEADCAUSE.BIRTH {
						log_warning("world.creature_remove not found in dead creature list "+string(_id)+" at "+string(_id.x)+","+string(_id.y));
					}
			}
	}

}