// change creature position and move it from cell if necessary
// if don't wrap and goes beyond world, die


function world_creature_move(_id, _xTo, _yTo){
	
	var _x_origin = _id.x;
	var _y_origin = _id.y;
	var _xTo_origin = _xTo;
	var _yTo_origin = _yTo;

	// adjust wrap if moving beyond limits
	
	if _xTo < 0 or _xTo >= controller.world.world_max_x {
		if WORLD_WRAP_X {
			_xTo = wrap(_xTo_origin, controller.world.world_max_x);
		}
		else {
			_id.structure.is_dead = true;
			_id.structure.dead_cause = DEADCAUSE.GONE;
		}
	}
			
	if _yTo < 0 or _yTo >= controller.world.world_max_y  {
		if WORLD_WRAP_Y {
			_yTo = wrap(_yTo_origin, controller.world.world_max_y);
		}
		else {
			_id.structure.is_dead = true;
			_id.structure.dead_cause = DEADCAUSE.GONE;
		}
	}
		
	// move
	
	_id.x = _xTo;
	_id.y = _yTo;
	
	// if has wrapped adjust home
	
	if _xTo != _xTo_origin or _yTo != _yTo_origin {
		_id.brain.home_x = _id.x - (_x_origin - _id.brain.home_x);
		_id.brain.home_y = _id.y - (_y_origin - _id.brain.home_y);
	}
		
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