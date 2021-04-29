function _genus_load_csv(){


	if ! file_exists(FILE_GENUS_CSV) {
		show_message("File "+FILE_GENUS_CSV+" not found");
		return -1;
	}
	else {
		
		file_grid = csv_to_grid(FILE_GENUS_CSV);
	
		/*
		var ww = ds_grid_width(file_grid);
		var hh = ds_grid_height(file_grid);
		var xx = 32;
		var yy = 32;
		for (var i = 0; i < ww; i++;)
		    {
		    for (var j = 0; j < hh; j++;)
		        {
				show_debug_message(string(file_grid[# i, j]));
		        yy += 32;
		        }
		    yy = 32;
		    xx += 32;
		    }
		*/
		return file_grid;
	}
	
}