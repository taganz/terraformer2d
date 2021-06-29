// create a cell at pixel position
// returns cell or -1 if error
function world_create_cell_pixel(_x, _y){
	with controller.world {
		if (world_is_inside_pixel(_x, _y)) {
			return _grid_create_cell(_x div cell_size_px, _y div cell_size_px);
		}
		else {
			ASSERT(false, 0, "grid_create_cell_pixel pixel outside world "+string(_x)+","+string(_y));
			return -1;
		}
	}
	
}