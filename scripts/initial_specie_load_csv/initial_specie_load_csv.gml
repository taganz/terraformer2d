// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initial_specie_load_csv(){

// read csv
//file_grid = load_csv("initial_species.csv");


if ! file_exists(FILE_INITIAL_SPECIES_CSV) {
	show_message("File "+FILE_INITIAL_SPECIES_CSV+" not found");
	return -1;
}
else {
	file_grid = csv_to_grid(FILE_INITIAL_SPECIES_CSV);
	
	var ww = ds_grid_width(file_grid);
	var hh = ds_grid_height(file_grid);
	var xx = 32;
	var yy = 32;
	for (var i = 0; i < ww; i++;)
	    {
	    for (var j = 0; j < hh; j++;)
	        {
			show_debug_message(string(file_grid[# i, j]));
	        //draw_text(xx, yy, string(file_grid[# i, j]));
	        yy += 32;
	        }
	    yy = 32;
	    xx += 32;
	    }
	return file_grid;
	}
}