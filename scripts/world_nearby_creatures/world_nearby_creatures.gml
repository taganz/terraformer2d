// return list of creatures of a given kind in 9 cells. try first same cell
// assumes that calling creature is at _x, _y 
// in
//   x, y
//	 kind = "small_producer" or "big_producer" or "primary"
function world_get_nearby_creatures(_x, _y, kind){


	with controller.world {
		
		//var _msg = "";
		var _xx = _x div CELL_SIZE;
		var _yy = _y div CELL_SIZE;
		
		// try first same cell
		
		switch (kind) {
			case "small_producer":
				var _list = grid_cells[# _xx, _yy].list_producers_small;
				break;
			case "big_producer":
				var _list = grid_cells[# _xx, _yy].list_producers_big;
				break;
			case "primary":
				var _list = grid_cells[# _xx, _yy].list_primaries;
				break;
			default:
				ASSERT(false, 0, "get_creatures_close_cells invalid parameter kind="+string(kind));
		}
			
		
		// if nothing at same cell look for nearby cells
		
		if ds_list_size(_list) == 0 {			

			// chose first cell at random to avoid everybody moving in the same direction to eat
			var i1 = choose(4, 5, 6);
			var j1 = choose(4, 5, 6);
			for (var i = i1; i < i1 +3; i++) {
				for (var j = j1; j < j1+3; j++) {
					var _xx_check = _xx + (i mod 3) -1;
					var _yy_check = _yy + (j mod 3) -1;
					
					if world_is_inside_cell(_xx_check, _yy_check) {
					
						// check if there is a initialized cell. if so, get list_creatures
						var _cell = grid_cells[# _xx_check, _yy_check];
						if _cell!= 0 {				
							switch (kind) {
								case "small_producer":
									_list = _cell.list_producers_small;
									break;
								case "big_producer": 
									_list = _cell.list_producers_big;
									break;
								case "primary":
									_list = _cell.list_primaries;
							}
							if ds_list_empty(_list)
								break;
						}
					}
				}
			}		
		}
		return _list;

	}
	
}

