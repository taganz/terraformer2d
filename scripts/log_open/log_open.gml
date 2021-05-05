// === log_open
function log_open(){

	with controller.log {
		


		if controller.user_options.LOG_ALLOW_LOG {

			//_filename = SIM_LOG_FILE_NAME + string(current_day)+"_"+string(current_hour) + "_" + string(current_minute) + ".csv";
			_filename = SIM_LOG_FILE_NAME + ".csv";
			_file = file_text_open_write(working_directory + _filename);
			// title
			file_text_write_string(_file, _heading+ "\n");
			show_debug_message("log_event - File created: "+working_directory+_filename);

		}
		else {
			show_debug_message("*** controller.user_options is FALSE. Not generating log file");
		}
	}
}
