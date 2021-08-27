
// _id can be 0

function ASSERT (_exp, _id, _msg) {
	if _exp == false {
		if show_question("*** ASSERT *** "+ _msg+ "\nAbort?") {
			game_end();
		}
		else { 		
			if variable_instance_exists(controller, "log") {
				log_event(LOGEVENT.INFO_ERROR_ASSERT, _id, _msg);
			}
		}
	}
}