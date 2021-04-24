

function deadcause_to_string(_dead_cause) {
	var _msg = "???";
	switch (_dead_cause) {
	    case  DEADCAUSE.OLD: _msg = "OLD"; break;
	    case  DEADCAUSE.STARVING: _msg = "STARVING"; break;
	    case  DEADCAUSE.EATEN: _msg = "EATEN"; break;
	    case  DEADCAUSE.ILL: _msg = "ILL"; break;
	    case  DEADCAUSE.BIRTH: _msg = "BIRTH"; break;
	}
	return _msg;
}
