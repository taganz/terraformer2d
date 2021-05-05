// clase file
function log_close(){

	if controller.user_options.LOG_ALLOW_LOG {
		
		with controller.log {
		
			_log_write_buffer();
			file_text_close(_file);
			// why is working_directory showing strange value "y:\..."??
			show_debug_message("log_event -- File closed: "+working_directory+_filename );
		}
	}
		
	
}