/*
	- Store species
*/

function Species() constructor {

	// this map stores  prefixes - number of variants for this prefix
	//_prefixes_map = ds_map_create();
	
	// === read gen values for initial species grid
	// columns are initial species
	// rows are gens
	// grid can contain comment rows. valid rows contain "INITIAL_SPECIE" or gen names in first column
	_initial_species_grid = _initial_specie_load_csv();
	
	_initial_species_max_species = ds_grid_width(file_grid);
	_initial_species_max_rows = ds_grid_height(file_grid);
	
	// get row with initial species code
	ASSERT(ds_grid_value_exists(_initial_species_grid, 0, 0, 0, _initial_species_max_rows, "INITIAL_SPECIE"), 0, "INITIAL SPECIES ROW NOT FOUND IN SPECIES FILE");
	_initial_species_code_row = ds_grid_value_y(_initial_species_grid, 0, 0, 1, _initial_species_max_rows, "INITIAL_SPECIE");
	
	
	// store last variant for each initial specie
	_initial_species_last_variant = array_create(_initial_species_max_species);
			

}