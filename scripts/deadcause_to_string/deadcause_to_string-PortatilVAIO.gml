
enum DEADCAUSE {
	OLD,
	STARVING,
	EATEN
}

function deadcause_to_string(_dead_cause) {
	var _msg = "???";
	switch (_dead_cause) {
	    case  DEADCAUSE.OLD: _msg = "OLD"; break;
	    case  DEADCAUSE.STARVING: _msg = "STARVING"; break;
	    case  DEADCAUSE.EATEN: _msg = "EATEN"; break;
	}
	return _msg;
}
