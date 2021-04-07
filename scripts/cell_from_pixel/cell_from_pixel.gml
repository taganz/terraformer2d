function cell_from_pixel (_x, _y) {
		return controller.world.grid_cells[# _x div CELL_SIZE_PX, _y div CELL_SIZE_PX];
}
