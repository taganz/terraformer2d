
function log_error(_msg){

	show_debug_message("*** ERROR *** "+_msg);
	log_event(LOGEVENT.ERROR, 0, _msg);
}