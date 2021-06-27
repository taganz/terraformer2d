// return true if there is room for a creature of this family in a cell list
function family_cell_room_grid(_id, _grid) {

	var family_occupied_area = 0;
	var _id_family = _id.genome[GEN.FAMILY];	
	for (var i = 0; i < ds_grid_height(_grid);i++) {
		if _grid[# 0, i] != 0 {
			var f = genus_get_gen(_grid[# 0, i].genome[GEN.GENUS_ID], GEN.FAMILY);
			if f == _id_family {
				family_occupied_area += family_get_area(f);
			}
		}
	}
	return family_occupied_area < CELL_AREA;
}							
						