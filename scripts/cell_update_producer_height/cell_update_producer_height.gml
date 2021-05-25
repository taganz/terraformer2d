function cell_update_producer_height(_id){
	var row = ds_grid_value_y(_id.my_cell.grid_producers, 0, 0, 0, _id.my_cell._grid_producers_current, _id);
	if row != -1  {
		_id.my_cell.grid_producers[# 1, row] = _id.structure.my_height;
	}
	else {
		var _breakpoint = 1;
	}
}