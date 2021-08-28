
// _id can be 0

game_end_triggered = false;

function ASSERT (_exp, _id, _msg) {
	if _exp == false {
		// avoid reentering 
		if global.game_end_triggered == false {
			if show_question("*** ASSERT *** "+ _msg+ "\nAbort?") {
				show_debug_message("*** ASSERT ABORT *** "+ _msg);
				global.game_end_triggered = true;
				game_end();
			}
			else { 		
				if variable_instance_exists(controller, "log") {
					log_event(LOGEVENT.INFO_ERROR_ASSERT, _id, _msg);
				}
			}
		}
	}
}