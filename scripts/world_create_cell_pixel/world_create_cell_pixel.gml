// create a cell at pixel position
function world_create_cell_pixel(_x, _y){
	with controller.world {
		ASSERT(world_is_inside_pixel(_x, _y), 0, "grid_create_cell_pixel");
		_grid_create_cell(_x div CELL_SIZE, _y div CELL_SIZE);
	}
	
}