

#macro CSV_SEPARATOR ";"
	
	
function Statistics() constructor {
	
	// 
	
	
	// statistics
	
	creatures_live_now = [];
	biomass = [];
	log_count = 0;
	
	
	// get logging data
	// _t not used now <----- 
	
	step = function (_t) {
		
		creatures_live_now[log_count] = controller.world.creatures_live_now;
		biomass[log_count] = controller.world.biomass;
		log_count++;
		//show_debug_message(string(_t)+"_"+string(creatures_live_now[_t]));
	}

	/*
	// _filename should not have extension
	save_csv = function (_filename) {
		var file;
		_filename = _filename + string(current_day)+"_"+string(current_hour) + "_" + string(current_minute) + ".csv";
		file = file_text_open_write(working_directory + _filename);
		// title
		var _heading = 
				"time"
				 + CSV_SEPARATOR
				 + "creatures"
				 + CSV_SEPARATOR
				 + "biomass"
				 ;
		file_text_write_string(file, _heading+ "\n");
		// write data
		for (var i=0;i<log_count;i++) {
			var _data_string = 
				string(i)
				+ CSV_SEPARATOR 
				+string(creatures_live_now[i])
				+ CSV_SEPARATOR
				+string(biomass[i])
				;
			file_text_write_string(file, _data_string + "\n");
		}
		file_text_close(file);
		// why is working_directory showing strange value "y:\..."??
		show_debug_message("File saved: "+working_directory+_filename + " with "+string(log_count)+" lines.");
	}


*/

}