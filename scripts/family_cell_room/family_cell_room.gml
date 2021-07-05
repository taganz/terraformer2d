
// return true if there is room for a creature of this family in a cell list

function family_cell_room(_id, list) {

	var family_occupied_area = 0;
	var _id_family = _id.genome[GEN.FAMILY];	
	
	
	for (var i = 0; i < ds_list_size(list);i++) {
		if list[|i] != 0 {
			if instance_exists(list[|i]) {
				var f = genus_get_gen(list[| i].genome[GEN.GENUS_ID], GEN.FAMILY);
				if f == _id_family {
					family_occupied_area += family_get_area(f);
				}
			}
		}
	}
	return family_occupied_area < CELL_AREA;
}							
						