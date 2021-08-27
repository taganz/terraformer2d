// returns leftmost pixel x for cell - scaled for screen, not for room
function grid_pixel_x_from_cell_x(_cell_x){
	return _cell_x * controller.world.cell_size_px;
}