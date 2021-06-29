// change creature position and move it from cell if necessary
// if destination cell is full, stay at same place
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
		
		
	if _id.structure.is_dead == false {
		
		// move
	
		_id.x = _xTo;
		_id.y = _yTo;
	
		
		// moving means cell change?
	
		if (_x_origin div controller.world.cell_size_px != _xTo div controller.world.cell_size_px) 
			or (_y_origin div controller.world.cell_size_px != _yTo div controller.world.cell_size_px) {
			
			// add to new cell
			var new_cell = _cell_add_creature (_id, _xTo div controller.world.cell_size_px, _yTo div controller.world.cell_size_px);
		
			if new_cell != -1 {
			
				// if cell change was successful update creature cell
				_id.my_cell = new_cell;
			
				// remove from old cell
				_cell_remove_creature(_id, _x_origin div controller.world.cell_size_px, _y_origin div controller.world.cell_size_px);

			}
			else {
			
				// could not move to other cell, probably was crowded, restore position
				_id.x = _x_origin;
				_id.y = _y_origin;
			}
		}


		// if has moved and has wrapped adjust home
	
		if _id.x != _x_origin or _id.y != _y_origin {
			if _xTo != _xTo_origin or _yTo != _yTo_origin {
				_id.brain.home_x = _id.x - (_x_origin - _id.brain.home_x);
				_id.brain.home_y = _id.y - (_y_origin - _id.brain.home_y);
			}
		}
	}
}