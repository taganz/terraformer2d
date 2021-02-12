/// @function            climate_to_string(climate)
/// @description         Returns description
/// @param {real} climate    Climate for the cell



function climate_to_string(_climate) {
	
	return controller.world.climates[_climate].name;
	/*
	var _msg = "???";
	switch(_climate){
		case CLIMATE.CLIMATE_0:
			_msg = "CLIMATE.CLIMATE_0 - WARNING";  // should not happen
			break;
		case CLIMATE.CLIMATE_1:
			_msg = "CLIMATE.CLIMATE_1";
			break;
		case CLIMATE.CLIMATE_2:
			_msg = "CLIMATE.CLIMATE_2";
			break;
		case CLIMATE.CLIMATE_3:
			_msg = "CLIMATE.CLIMATE_3";
			break;
		case CLIMATE.CLIMATE_4:
			_msg = "CLIMATE.CLIMATE_4";
			break;
		case CLIMATE.CLIMATE_5:
			_msg = "CLIMATE.CLIMATE_5";
			break;
		case CLIMATE.CLIMATE_6:
			_msg = "CLIMATE.CLIMATE_6";
			break;
		case CLIMATE.CLIMATE_7:
			_msg = "CLIMATE.CLIMATE_7";
			break;
		case CLIMATE.CLIMATE_8:
			_msg = "CLIMATE.CLIMATE_8";
			break;
		case CLIMATE.CLIMATE_9:
			_msg = "CLIMATE.CLIMATE_9";
			break;
	}
	return _msg;
	*/
}
