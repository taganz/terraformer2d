function trophic_level_to_char(tlevel) {
	var _msg = "?";
	switch(tlevel) {
		case TROPHIC_LEVEL.PRODUCER:	_msg = "P"; break;
		case TROPHIC_LEVEL.PRIMARY:		_msg = "H"; break;
		case TROPHIC_LEVEL.SECONDARY:	_msg = "S"; break;
	}
	return _msg;
}