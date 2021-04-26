// returns value for gen in initial specie
// returns -999999999 if error
function initial_specie_gen_value(initial_specie, gen){

	
	// read specie values from initial_species_grid (columns are species, rows are gens)
	
	with controller.species  {
		
		// get column for this specie
		var _col = ds_grid_value_x(_initial_species_grid, 1, _initial_species_code_row, _initial_species_max_species, _initial_species_code_row, initial_specie);
		if _col == -1  
			return -999999999;
			
		// get row for this gen
		var _row = ds_grid_value_y(_initial_species_grid, 0, 0, 0, _initial_species_max_rows, gen_to_string(gen));
		if _row == -1
			return -999999999;

		// get value
		var _cell =  _initial_species_grid[# _col, _row];
		
	}
	
	/*
	// avoid empty cells in csv file
	if is_numeric(_cell) == false {
		log_error("initial_specie_gen_value - invalid gen value "+string(_cell)+" "+string(initial_specie)+" "+string(gen)); 
		_cell = 0;
	}
	*/	
	return _cell;

}