function cell_update_producer_height(_id){
	
	if _id.my_cell != 0  {		// death at born creatures may not be initialized 
		var row = ds_grid_value_y(_id.my_cell.grid_producers, 0, 0, 0, _id.my_cell._grid_producers_current, _id);
		if row != -1  {
			//ASSERT(_id.structure.my_height>0, _id, "cell_update_producer_height height==0");  // can not have 0 height in grid producers
			_id.my_cell.grid_producers[# 1, row] = _id.structure.my_height;
		}
		else {
			var _breakpoint = 1;
		}
	}	
}