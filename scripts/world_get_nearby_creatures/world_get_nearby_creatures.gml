// return list of creatures of a given trophic level in 9 cells. try first same cell
// assumes that calling creature is at _x, _y 

function world_get_nearby_creatures(_x, _y, _trophic_level){


	with controller.world {

		// translate pixel to cell coordinates

		var _xx = _x div cell_size_px;
		var _yy = _y div cell_size_px;
		
		// try first same cell
		
		switch (_trophic_level) {
			case TROPHIC_LEVEL.PRODUCER:
				// transform grid to list			
				var _list = ds_list_create()
				for (var c=0; c<grid_cells[# _xx, _yy]._grid_producers_current; c++) {
					ds_list_add(_list, grid_cells[# _xx, _yy].grid_producers[# 0, c]);
				}
				break;
			case TROPHIC_LEVEL.PRIMARY:
				var _list = grid_cells[# _xx, _yy].list_primaries;
				break;
			default:
				ASSERT(false, 0, "get_creatures_close_cells invalid parameter ="+trophic_level_to_string(_trophic_level));
		}
			
		
		// if nothing at same cell look for nearby cells
			
		if ds_list_empty(_list) == true {

			// chose first cell at random to avoid everybody moving in the same direction to eat

			var i1 = choose(3, 4, 5);
			var j1 = choose(3, 4, 5);
			for (var i = i1; i < i1 +3; i++) {
				for (var j = j1; j < j1+3; j++) {
					var _xx_check = _xx + (i mod 3) -1;
					var _yy_check = _yy + (j mod 3) -1;
					
					if world_is_inside_cell(_xx_check, _yy_check) {
					
						// if there is a initialized cell get list_creatures
						var _cell = grid_cells[# _xx_check, _yy_check];
						if _cell!= 0 {				
							switch (_trophic_level) {
								case TROPHIC_LEVEL.PRODUCER:
									for (var c=0; c<grid_cells[# _xx_check, _yy_check]._grid_producers_current; c++) {
										ds_list_add(_list, grid_cells[# _xx_check, _yy_check].grid_producers[# 0, c]);
									}
									break;
								case TROPHIC_LEVEL.PRIMARY:
									_list = _cell.list_primaries;
							}
							if ds_list_empty(_list) == false {
								break;
							}
						}
					}
				}
			}		
		}
		return _list;

	}
	
}

