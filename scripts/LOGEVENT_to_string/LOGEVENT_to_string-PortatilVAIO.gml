
function LOGEVENT_to_string(_log_event){

	var _msg = "??????";
	switch (_log_event) {
		//case LOGEVENT.CREATURE_ADULT:			_msg = "ADULT"; break;
		case LOGEVENT.CREATURE_ANABOLISM:		_msg = "ANABOLISM"; break;
		case LOGEVENT.CREATURE_BEEN_EATED:		_msg = "BEEN_EATED"; break;
		case LOGEVENT.CREATURE_BIOMASS:			_msg = "BM"; break;
		case LOGEVENT.CREATURE_BIOMASS_EAT:		_msg = "BM_EAT"; break;
		case LOGEVENT.CREATURE_BIOMASS_BODY:	 _msg = "BM_BODY"; break;
		case LOGEVENT.CREATURE_BIOMASS_REPRODUCTION: _msg = "BM_REPRODUCTION"; break;
		case LOGEVENT.CREATURE_BIOMASS_RESERVE: _msg = "BM_RESERVE"; break;
		case LOGEVENT.CREATURE_BORN:			_msg = "BORN"; break;
		case LOGEVENT.CREATURE_BORN_INFO:		_msg = "BORN_INFO"; break;
		case LOGEVENT.CREATURE_BORN_INFO_NUM:	_msg = "BORN_INFO_NUM"; break;
		case LOGEVENT.CREATURE_CATABOLISM:		_msg = "CATABOLISM"; break;
		case LOGEVENT.CREATURE_DECOMPOSE:		_msg = "DECOMPOSE"; break;
		case LOGEVENT.CREATURE_DECOMPOSE_COMPLETED:	_msg = "DECOMPOSE_COMPLETED"; break;
		case LOGEVENT.CREATURE_DEAD:			_msg = "DEAD"; break;
		case LOGEVENT.CREATURE_DEAD_INFO:		_msg = "DEAD_INFO"; break;
		case LOGEVENT.CREATURE_DEAD_INFO_NUM:	_msg = "DEAD_INFO_NUM"; break;
		case LOGEVENT.CREATURE_EAT:				_msg = "EAT"; break;
		case LOGEVENT.CREATURE_LIFE_EVENT:		_msg = "LIFE_EVENT"; break;
		case LOGEVENT.CREATURE_RAIN:			_msg = "CREATURE_RAIN"; break;
		case LOGEVENT.CREATURE_REPRODUCTION:	_msg = "REPRODUCTION"; break;
		case LOGEVENT.CREATURE_STARVING:		_msg = "STARVING"; break;
		case LOGEVENT.CREATURE_TEMPERATURE:		_msg = "TEMPERATURE"; break;
		case LOGEVENT.CREATURE_WATER_RECEIVED:	_msg = "WATER_RECEIVED"; break;
		case LOGEVENT.CREATURE_DEBUG:			_msg = "CREATURE_DEBUG"; break;
		
		case LOGEVENT.SPECIE_NEW:				_msg = "SPECIE_NEW"; break;
		case LOGEVENT.SPECIE_CLIMATE_BORN:		_msg = "SPECIE_CLIMATE_BORN"; break;
		case LOGEVENT.SPECIE_CLIMATE_DEAD:		_msg = "SPECIE_CLIMATE_DEAD"; break;
		
		//case LOGEVENT.WORLD_PROBE_NUTRIENTS:			_msg = "WORLD_PROBE_NUTRIENTS"; break;
		//case LOGEVENT.WORLD_PROBE_WATER:				_msg = "WORLD_PROBE_WATER"; break;
		case LOGEVENT.WORLD_SPAWNER:					_msg = "SPAWNER"; break;
		case LOGEVENT.WORLD_POPULATION:					_msg = "WORLD_POPULATION"; break;
		case LOGEVENT.WORLD_PROBE_RAIN_TEMP:			_msg = "WORLD_PROBE_RAIN_TEMP"; break;
		case LOGEVENT.WORLD_PROBE_PLANT_AVAILABLE_WATER: _msg = "PLANT_AVAILABLE_WATER"; break;
		
		
		case LOGEVENT.INFO_WARNING:				_msg = "WARNING"; break;
		case LOGEVENT.INFO_ERROR:				_msg = "ERROR"; break;
		case LOGEVENT.INFO_ERROR_ASSERT:		_msg = "ERROR ASSERT"; break;
		case LOGEVENT.INFO_PARAMETERS:			_msg = "PARAMETERS"; break;
	}
	return _msg;

}