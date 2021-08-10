function state_to_string(state){
	
		var _t = "";
		switch(state) {
			//case STATE.BORN:		_t = "BORN"; break;
			case STATE.IDLE:		_t = "."; break;
			case STATE.EAT:			_t = "EAT"; break;
			case STATE.REPRODUCTION: _t = "REPRODUCTION"; break;
			case STATE.ESCAPE:		_t = "ESCAPE"; break;
			case STATE.DEAD:		_t = "DEAD"; break;
			default:				_t = "STATE ???"; break;
		}
		return _t;
}