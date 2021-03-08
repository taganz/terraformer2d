function cell_from_pixel (_x, _y) {
		return controller.world.grid_cells[# _x div CELL_SIZE, _y div CELL_SIZE];
}
