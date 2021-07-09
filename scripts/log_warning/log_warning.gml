
function log_warning(_msg){
	show_debug_message("*** WARNING *** "+_msg);
	log_event(LOGEVENT.INFO_WARNING, 0, _msg);
}