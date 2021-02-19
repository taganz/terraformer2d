function trophic_level_to_string(_tl) {
	var _msg = "???";
	switch(_tl){
		case TROPHIC_LEVEL.PRODUCER:	_msg = "PRODUCER"; break;
		case TROPHIC_LEVEL.PRIMARY:		_msg = "PRIMARY"; break;
		case TROPHIC_LEVEL.SECONDARY:	_msg = "SECONDARY"; break;
	}
	return _msg;
}

