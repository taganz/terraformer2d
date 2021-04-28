/*
	- Store species
*/

function Species() constructor {

	// this map stores  prefixes - number of variants for this prefix
	//_prefixes_map = ds_map_create();
	
	// === read gen values for initial species grid
	// columns are initial species
	// rows are gens
	// grid can contain comment rows. valid rows contain "GENUS" or gen names in first column
	_genus_grid = _genus_load_csv();
	
	_genus_max_species = ds_grid_width(file_grid);
	_genus_max_rows = ds_grid_height(file_grid);
	
	// get row with initial species code
	ASSERT(ds_grid_value_exists(_genus_grid, 0, 0, 0, _genus_max_rows, "GENUS"), 0, "INITIAL SPECIES ROW NOT FOUND IN SPECIES FILE");
	_genus_code_row = ds_grid_value_y(_genus_grid, 0, 0, 1, _genus_max_rows, "GENUS");
	
	
	// store last variant for each initial specie
	_genus_last_variant = array_create(_genus_max_species);
			

}