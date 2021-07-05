function grid_reset_configurable_climate(_climate){

	if _climate != CLIMATE.DEFAULT {

		with controller.world {
		
			// for all cells in the grid
		
			for (var i=0; i< ds_grid_width(grid_cells); i++) {
				for (var j=0; j< ds_grid_height(grid_cells); j++) {

					var _cell = grid_cells[# i, j];
				
					// process only initialized cells
				
					if _cell!= 0 {
					
						// if climate was user defined, update
					
						if _cell._user_defined_climate == true {
							_cell.climate = _climate;
						}
					}
				}
			}
		}
	}
}