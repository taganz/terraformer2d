// return a string showing creatures and nutrients for cell corresponding to pixels _x, _y
function cell_to_string(_x, _y){
	
	with controller.world {
		if is_inside_world(_x, _y) {
			var cell = ds_grid_get(grid_cells, floor(_x/CELL_SIZE), floor(_y/CELL_SIZE));
			var s = string(floor(_x/CELL_SIZE)) +","+ string(floor(_y/CELL_SIZE));
			// s = s + "\nbiomass_decomposition_factor: "+string(biomass_decomposition_factor);
			if (cell == 0)
				return s+": empty cell";
			else
				return s+":\n"+cell.to_string();
		}
		else {
			return "error x,y cell_to_string";
		}
	}
}