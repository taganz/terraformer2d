// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum TROPHIC_LEVEL {
	PRODUCER,
	PRIMARY,
	SECONDARY
}

function trophic_level_to_string(_tl) {
	var _msg = "???";
	switch(_tl){
		case TROPHIC_LEVEL.PRODUCER:	_msg = "PRODUCER"; break;
		case TROPHIC_LEVEL.PRIMARY:		_msg = "PRIMARY"; break;
		case TROPHIC_LEVEL.SECONDARY:	_msg = "SECONDARY"; break;
	}
	return _msg;
}