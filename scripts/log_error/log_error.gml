
function log_error(_msg){

	show_debug_message("*** ERROR *** "+_msg);
	LOG(LOGEVENT.ERROR, 0, _msg);
}