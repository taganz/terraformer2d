function genome_create(_initial_specie){

	var _genome = array_create (GEN_NUM, 0);
	var ww = ds_grid_width(controller.species._initial_species_grid);
	var hh = ds_grid_height(controller.species._initial_species_grid);
	
	// get column for specie
	ASSERT(ds_grid_value_exists(controller.species._initial_species_grid, 0, 0, 0, hh, "INITIAL_SPECIE"), 0, "INITIAL SPECIES ROW NOT FOUND");
	var y_initial_specie = ds_grid_value_y(controller.species._initial_species_grid, 0, 0, 0, hh, "INITIAL_SPECIE");
	ASSERT(ds_grid_value_exists(controller.species._initial_species_grid, 1, y_initial_specie, ww, y_initial_specie, _initial_specie), 0, "INITIAL SPECIES COLUMN NOT FOUND "+string(_initial_specie));
	var x_initial_specie = ds_grid_value_x(controller.species._initial_species_grid, 1, y_initial_specie, ww, y_initial_specie, _initial_specie);

	for (var i=0; i<GEN_NUM;i++) {
	
		// get row for this gen
		var yy = ds_grid_value_y(controller.species._initial_species_grid, 0, 0, 1, hh, gen_to_string(i));
		if (yy>0) {
				var _cell =  controller.species._initial_species_grid[# x_initial_specie, yy];
				if _cell != "" or i < GEN_FIRST_MUTABLE
					_genome[i] = _cell;
				else
					_genome[i] = 0;
		}
		else {
			_genome[i] = 0;
			log_error("*** ERROR *** gen not found in inital_species_grid "+gen_to_string(i))
		}
	
	}
	
	
	//_genome[GEN.INITIAL_SPECIE] = _initial_specie;    
	_genome[GEN.PARENT_SPECIE_CODE] = "NOPARENT";
	_genome[GEN.SPECIE_CODE] = specie_code_initial(_genome[GEN.TROPHIC_LEVEL], _initial_specie);    
		

	return _genome;
	
}





