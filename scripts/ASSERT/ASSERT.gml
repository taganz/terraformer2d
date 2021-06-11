
// _id can be 0

function ASSERT (_exp, _id, _msg) {
	if _exp == false {
		show_debug_message("*** ASSERT *** "+ _msg);
		log_event(LOGEVENT.INFO_ERROR_ASSERT, _id, _msg);
	}
}