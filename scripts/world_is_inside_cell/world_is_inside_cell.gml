// is this cell inside the window?
function world_is_inside_cell(_xx_check, _yy_check){
	
	with controller.world {
		return _xx_check >= 0 && _yy_check >= 0 && _xx_check < width_cells && _yy_check < height_cells;
	}
}