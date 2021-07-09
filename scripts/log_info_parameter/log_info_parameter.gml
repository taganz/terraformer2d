function log_info_parameter(_name, _value){
		show_debug_message("INFO_PARAMETERS: "+ string(_name) + string(_value) );
		log_event(LOGEVENT.INFO_PARAMETERS, 0, string(_name), string(_value)); 
}