// change creature position and move it from cell if necessary

function world_creature_move(_id, _xTo, _yTo){
	
	var _x_origin = _id.x;
	var _y_origin = _id.y;

	// change creature position
	_id.x = _xTo;
	_id.y = _yTo;

		
	// has changed cell?
	if (_x_origin div CELL_SIZE_PX != _xTo div CELL_SIZE_PX) 
		|| (_y_origin div CELL_SIZE_PX != _yTo div CELL_SIZE_PX) {
			
		// remove from old cell
		_cell_remove_creature(_id, _x_origin div CELL_SIZE_PX, _y_origin div CELL_SIZE_PX);

		// add to new cell
		var new_cell = _cell_add_creature (_id, _xTo div CELL_SIZE_PX, _yTo div CELL_SIZE_PX);
		
		// update creature cell
		_id.my_cell = new_cell;
	}

}