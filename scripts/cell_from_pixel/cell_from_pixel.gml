function cell_from_pixel (_x, _y) {
		return controller.world.grid_cells[# _x div controller.world.cell_size_px, _y div controller.world.cell_size_px];
}
