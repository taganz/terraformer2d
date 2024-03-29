// returns value for gen in genus
// returns -999999999 if error
function genus_get_gen(genus_id, gen){

	
	// read specie values from _genus_grid (columns are species, rows are gens)
	
	with controller.species  {
		
		// get column for this specie
		var _col = ds_grid_value_x(_genus_grid, 1, _genus_code_row, _genus_max_columns, _genus_code_row, genus_id);
		if _col == -1  
			return -999999999;
			
		// get row for this gen
		var _row = ds_grid_value_y(_genus_grid, 0, 0, 0, _genus_max_rows, gen_to_string(gen));
		if _row == -1
			return -999999999;

		// get value
		var _cell =  _genus_grid[# _col, _row];
		
	}
	
	/*
	// avoid empty cells in csv file
	if is_numeric(_cell) == false {
		log_error(" - invalid gen value "+string(_cell)+" "+string(initial_specie)+" "+string(gen)); 
		_cell = 0;
	}
	*/	
	return _cell;

}