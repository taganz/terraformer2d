
function log_error(_msg){

	show_debug_message("*** ERROR *** "+_msg);
	log_event(LOGEVENT.INFO_ERROR, 0, _msg);
}
