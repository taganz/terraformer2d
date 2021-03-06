/*

   Log class 
   - Outputs info to user about game events (creature born, dead,...)
   - One specific creature can be followed for output
   

*/


#macro BUFFER_LINES 5000
#macro SIM_LOG_FILE_NAME "SIM_LOG"

#macro CSV_SEPARATOR ";"


// == log event codes

enum LOGEVENT {
	//CREATURE_ADULT,
	CREATURE_BORN,
	CREATURE_BORN_INFO,
	CREATURE_BORN_INFO_NUM,
	CREATURE_ANABOLISM,					// obtained biomass during metabolism
	CREATURE_CATABOLISM,				// consumed biomass during metabolism
	CREATURE_DEAD,
	CREATURE_DEAD_INFO,
	CREATURE_DEAD_INFO_NUM,
	CREATURE_BIOMASS,					// biomass at the end of step
	CREATURE_BIOMASS_EAT,			
	CREATURE_BIOMASS_BODY,			
	CREATURE_BIOMASS_REPRODUCTION,			
	CREATURE_BIOMASS_RESERVE,		// 
	CREATURE_DECOMPOSE,
	CREATURE_DECOMPOSE_COMPLETED,
	CREATURE_EAT,
	CREATURE_BEEN_EATED,
	CREATURE_DEBUG,
	CREATURE_LIFE_EVENT,
	CREATURE_STARVING,
	CREATURE_REPRODUCTION,
	CREATURE_TEMPERATURE,				// at cell this month
	CREATURE_RAIN,						// at cell this month
	CREATURE_WATER_RECEIVED,			// plants
	SPECIE_NEW,							
	CLIMATE_BORN,			
	PROBE_NUTRIENTS,
	PROBE_WATER,					
	PROBE_TEMPERATURE,					
	SPAWNER,
	WORLD_POPULATION,				// total population for a trophic level
	PROBE_RAIN_TEMPERATURE,						
	WARNING,						// system warning
	ERROR,							// system error
	ERROR_ASSERT, 					// error from ASSERT function
	SIMULATION_PARAMETERS,				// info about simulation parameters
}



function log_event_to_string(_log_event) {
	var _msg = "??????";
	switch (_log_event) {
		case LOGEVENT.CLIMATE_BORN:				_msg = "CLIMATE_BORN"; break;
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
		case LOGEVENT.SPECIE_NEW:				_msg = "SPECIE_NEW"; break;
		case LOGEVENT.PROBE_NUTRIENTS:			_msg = "PROBE_NUTRIENTS"; break;
		case LOGEVENT.PROBE_WATER:				_msg = "PROBE_WATER"; break;
		case LOGEVENT.SPAWNER:					_msg = "SPAWNER"; break;
		case LOGEVENT.WORLD_POPULATION:			_msg = "WORLD_POPULATION"; break;
		case LOGEVENT.PROBE_RAIN_TEMPERATURE:	_msg = "PROBE_RAIN_TEMP"; break;
		case LOGEVENT.CREATURE_DEBUG:			_msg = "CREATURE_DEBUG"; break;
		case LOGEVENT.WARNING:					_msg = "DEBUG WARNING"; break;
		case LOGEVENT.ERROR:					_msg = "DEBUG ERROR"; break;
		case LOGEVENT.ERROR_ASSERT:				_msg = "DEBUG ERROR ASSERT"; break;
		case LOGEVENT.SIMULATION_PARAMETERS:	_msg = "SIM PARAMETERS"; break;
	}
	return _msg;
}


// shorthands
#macro LOG		controller.log.log_simulation_event
#macro LOG_ID	controller.log.log_id						// <--- deprecated
//#macro LOG_ID_SAMPLED controller.log.log_id_sampled			// <--- deprecated

function Log() constructor{

	

#region var init, headings
	_filename = "";
	_file = -1;
	_line = 0;
	_lines_buffer = [];
	_heading = 
		 		  "time"
				 + CSV_SEPARATOR
		 		 + "month"
				 + CSV_SEPARATOR
		 		 + "year"
				 + CSV_SEPARATOR
				 + "EVENT"
				 + CSV_SEPARATOR
				 + "id1"
				 + CSV_SEPARATOR
				 + "name"
				 + CSV_SEPARATOR
				 + "thropic_level"
				 + CSV_SEPARATOR
				 + "specie"
				 + CSV_SEPARATOR
				 + "id2"
				 + CSV_SEPARATOR
				 + "x"
				 + CSV_SEPARATOR
				 + "y"
				 + CSV_SEPARATOR
				 + "num1"
				 + CSV_SEPARATOR
				 + "num2"
				 + CSV_SEPARATOR
				 + "txt1"
				 + CSV_SEPARATOR
				 + "txt2"
				 + CSV_SEPARATOR
				 + "txt3"
				 ;
#endregion



	// === log_open
	
	// create file 
	log_open = function() {
	
		log_data_init_world();

		if obj_gui.options_log {

			//_filename = SIM_LOG_FILE_NAME + string(current_day)+"_"+string(current_hour) + "_" + string(current_minute) + ".csv";
			_filename = SIM_LOG_FILE_NAME + ".csv";
			_file = file_text_open_write(working_directory + _filename);
			// title
			file_text_write_string(_file, _heading+ "\n");
			show_debug_message("LOG - File created: "+working_directory+_filename);

		}
		else {
			show_debug_message("*** obj_gui.options_log is FALSE. Not generating log file");
		}
	}


	// === main log event
	
	log_simulation_event = function(_event, _id1, _arg1, _arg2, _arg3) {
	
		if obj_gui.options_log == false
			return;
			
			
		var _col_id1 = "";
		var _col_name = "";
		var _col_trophic_level = "";
		var _col_specie = "";						
		var _col_id2 = "";
		var _col_x = "";
		var _col_y = "";
		var _col_num1 = "";
		var _col_num2 = "";
		var _col_txt1 = "";
		var _col_txt2 = "";
		var _col_txt3 = "";
		
		var _do_log = true;
		
	
		switch(_event) {
			//case LOGEVENT.CREATURE_ADULT:
			case LOGEVENT.CREATURE_ANABOLISM:
			case LOGEVENT.CREATURE_BEEN_EATED:
			case LOGEVENT.CREATURE_BIOMASS:
			case LOGEVENT.CREATURE_BIOMASS_EAT:
			case LOGEVENT.CREATURE_BIOMASS_BODY:
			case LOGEVENT.CREATURE_BIOMASS_REPRODUCTION:
			case LOGEVENT.CREATURE_BIOMASS_RESERVE:
			case LOGEVENT.CREATURE_BORN:
			case LOGEVENT.CREATURE_DEBUG: 
			case LOGEVENT.CREATURE_DEAD:
			case LOGEVENT.CREATURE_EAT:
			case LOGEVENT.CREATURE_DECOMPOSE:	
			case LOGEVENT.CREATURE_DECOMPOSE_COMPLETED:
			case LOGEVENT.CREATURE_CATABOLISM:
			case LOGEVENT.CREATURE_LIFE_EVENT:
			case LOGEVENT.CREATURE_RAIN:
			case LOGEVENT.CREATURE_REPRODUCTION:
			case LOGEVENT.CREATURE_STARVING:
			case LOGEVENT.CREATURE_TEMPERATURE:
			case LOGEVENT.CREATURE_WATER_RECEIVED:
			{
			
				// should we log this event?
				if (LOG_CREATURES_ALL
						or (LOG_CREATURES_FOLLOWING and _id1 == obj_gui.gui.creature_to_follow)) 
						or _id1.creature_log==true {
						

					// common 
					_col_id1 = string(_id1);
					_col_name = _id1.creature_log_name;
					_col_trophic_level = trophic_level_to_string(_id1.genome[GEN.TROPHIC_LEVEL]);
					_col_specie = string(_id1.genome[GEN.SPECIE_CODE]);
					_col_x = string(_id1.my_cell.x_cell);
					_col_y = string(_id1.my_cell.y_cell);
				
				
					//if _event == LOGEVENT.CREATURE_ADULT {
					//	_col_num1 = string(sim_steps_to_years(_id1.structure.age));		
					//	_col_txt1 = _arg1;
					//}
					
					// id2, num1, txt1, txt2
					if _event == LOGEVENT.CREATURE_BORN {
						_col_num1 = string(sim_steps_to_years(_id1.structure.age));		
						_col_txt1 = _id1.genome[GEN.SPECIE_CODE];
					}
					// 
					if _event == LOGEVENT.CREATURE_BEEN_EATED {
						_col_id2 = string(_arg1);
						_col_num1 = string(units_to_kg(_arg2));		
					}
					if _event == LOGEVENT.CREATURE_REPRODUCTION {
						_col_id2 = string(_arg1);
						_col_num1 = string(sim_steps_to_years(_id1.structure.age));		
						_col_num2 = string(units_to_kg(_arg2));		
					}
					if _event == LOGEVENT.CREATURE_EAT {
						_col_id2 = string(_arg1);
						_col_num1 = string(units_to_kg(_arg2));		// biomass got
						_col_txt1 = string(_arg3);		// msg
					}
					if _event == LOGEVENT.CREATURE_BIOMASS {
						_col_num1 = string(units_to_kg(_id1.structure.biomass));
						_col_txt1 = "kg"
					}
					if _event == LOGEVENT.CREATURE_BIOMASS_EAT {
						var _percent = (_arg1/_id1.structure.biomass);
						_col_num1 = string(units_to_kg(_arg1));	
						_col_num2 = string(_percent);
						_col_txt1 = string(_percent)+"% biomass"
					}
					if _event == LOGEVENT.CREATURE_BIOMASS_BODY {
						var _percent = (_arg1/_id1.structure.biomass);
						_col_num1 = string(units_to_kg(_arg1));	
						_col_num2 = string(_percent);
						_col_txt1 = string(_percent)+"% biomass"
					}
					if _event == LOGEVENT.CREATURE_BIOMASS_REPRODUCTION {
						var _percent = (_arg1/_id1.structure.biomass);
						_col_num1 = string(units_to_kg(_arg1));	
						_col_num2 = string(_percent);
						_col_txt1 = string(_percent)+"% biomass"
					}
					if _event == LOGEVENT.CREATURE_BIOMASS_RESERVE {
						_col_num1 = string(units_to_kg(_id1.structure._biomass_reserve_max));	
						var _percent = _id1.structure.biomass_reserve/_id1.structure._biomass_reserve_max;
						_col_num2 = string(_percent);
						_col_txt1 = string(_percent)+"% reserve max"
					}
					if _event == LOGEVENT.CREATURE_DEAD {
						_col_num1 = string(sim_steps_to_years(_id1.structure.age));	// age
						_col_txt1 = string(_arg1);				// deadcause
					}
					if _event == LOGEVENT.CREATURE_LIFE_EVENT {
						_col_num1 = string(sim_steps_to_years(_id1.structure.age));		
						_col_txt1 = _arg1;		// event name
						_col_txt2 = _arg2;		// event info
					}
					if _event == LOGEVENT.CREATURE_DEBUG {
						_col_txt1 = _arg1;
					}
					if _event == LOGEVENT.CREATURE_DECOMPOSE {
						_col_num1 = string(units_to_kg(_arg1));	
					}
					if _event == LOGEVENT.CREATURE_ANABOLISM {
						_col_num1 = string(units_to_kg(_arg1));
						_col_num2 = string_format(units_to_kg(_id1.structure.biomass), 4, 1);
						_col_txt1 = _arg2;
					}
					if _event == LOGEVENT.CREATURE_CATABOLISM {
						_col_num1 = string(units_to_kg(_arg1));
						_col_num2 = string_format(units_to_kg(_id1.structure.biomass), 4, 1);
					}
					if _event == LOGEVENT.CREATURE_TEMPERATURE {
						//_col_specie = "";
						_col_num1 = string(_arg1);
						_col_txt1 = string(_arg1)+"ºC";	
					}
					if _event == LOGEVENT.CREATURE_RAIN {
						//_col_specie = "";
						_col_num1 = string(_arg1);
						_col_txt1 = string(_arg1)+"mm";	
					}
					if _event == LOGEVENT.CREATURE_WATER_RECEIVED {
						//_col_specie = "";
						_col_num1 = string(_arg1);
						_col_txt1 = string(_arg1)+"l (tbc)";	
					}

				}
				else {							
					_do_log = false;
				}

				break;
			}
			case LOGEVENT.CREATURE_BORN_INFO:
			case LOGEVENT.CREATURE_BORN_INFO_NUM:
			case LOGEVENT.CREATURE_DEAD_INFO:
			case LOGEVENT.CREATURE_DEAD_INFO_NUM:
				if LOG_BORN_DEAD_SUMMARY 
				|| LOG_CREATURES_ALL
				|| (LOG_CREATURES_FOLLOWING and _id1 == obj_gui.gui.creature_to_follow) 
				|| _id1.creature_log==true {
						// common 
						_col_id1 = string(_id1);
						_col_name = _id1.creature_log_name;
						_col_trophic_level = trophic_level_to_string(_id1.genome[GEN.TROPHIC_LEVEL]);
						_col_specie = string(_id1.genome[GEN.SPECIE_CODE]);
						_col_x = string(_id1.my_cell.x_cell);
						_col_y = string(_id1.my_cell.y_cell);
				
						if _event == LOGEVENT.CREATURE_BORN_INFO {
							_col_txt1 = _arg1;		// tag
							_col_txt2 = _arg2;		// string value
						}
						if _event == LOGEVENT.CREATURE_BORN_INFO_NUM {
							_col_txt1 = _arg1;				// tag
							_col_num1 = string(_arg2);		// num value
						}
						if _event == LOGEVENT.CREATURE_DEAD_INFO {
							_col_txt1 = _arg1;		// tag
							_col_txt2 = _arg2;		// string value
						}
						if _event == LOGEVENT.CREATURE_DEAD_INFO_NUM{
							_col_txt1 = _arg1;				// tag
							_col_num1 = string(_arg2);		// num value
						}
				}
				else
				{
					_do_log = false;
				}
				break;
			case LOGEVENT.SPAWNER:
				break;
			case LOGEVENT.CLIMATE_BORN: {
				if LOG_WORLD {
					_col_id1 = string(_id1);
					_col_trophic_level = trophic_level_to_string(_id1.genome[GEN.TROPHIC_LEVEL]);
					_col_specie = string(_id1.genome[GEN.SPECIE_CODE]);
					if (_id1.my_cell != 0) {
						_col_x = string(_id1.my_cell.x_cell);
						_col_y = string(_id1.my_cell.y_cell);
					}
					_col_txt1 = _arg1;
					_col_txt2 = object_get_name(_id1.object_index);
				}
				else {
					_do_log = false;
				}
			}
			break;
			case LOGEVENT.WORLD_POPULATION: {
				if LOG_WORLD {
					_col_id1 = "";
					_col_trophic_level = trophic_level_to_string(_arg1);
					_col_num1 = string(_arg2);					
				}
				else {
					_do_log = false;
				}
			}
			break;
			case LOGEVENT.WARNING:
			case LOGEVENT.ERROR:
			case LOGEVENT.ERROR_ASSERT: {
				if _id1 != 0 {
					_col_id1 = string(_id1);
					_col_trophic_level = trophic_level_to_string(_id1.genome[GEN.TROPHIC_LEVEL]);
					_col_specie = string(_id1.genome[GEN.SPECIE_CODE]);
					if (_id1.my_cell != 0) {
						_col_x = string(_id1.my_cell.x_cell);
						_col_y = string(_id1.my_cell.y_cell);
					}
				}
				_col_txt1 = string(_arg1);
				break;
			}
			case LOGEVENT.PROBE_NUTRIENTS:
			case LOGEVENT.PROBE_WATER:
			case LOGEVENT.PROBE_RAIN_TEMPERATURE: {
				_col_name = _id1.probe_name;
				_col_x = string(_id1.my_cell.x_cell);
				_col_y = string(_id1.my_cell.y_cell);
				_col_txt1 = string_replace_all(_arg2, "\n", " - ");   // climate name
				
				if _event == LOGEVENT.PROBE_NUTRIENTS
					_col_num1 = string(units_to_kg(_arg1));
					
				if _event == LOGEVENT.PROBE_WATER
					_col_num1 = string(_arg1);
										
				if _event == LOGEVENT.PROBE_RAIN_TEMPERATURE {
					_col_num1 = string(_arg1);    // rain 
					_col_num2 = string(_arg3);	  // temperature
				}
				break;
			}
			case LOGEVENT.SIMULATION_PARAMETERS: {
				_col_txt1 = string(_id1);
				break;
			}
			case LOGEVENT.SPECIE_NEW: {
				_col_id1 = string(_id1);
				_col_trophic_level = trophic_level_to_string(_id1.genome[GEN.TROPHIC_LEVEL]);
				_col_x = string(_id1.my_cell.x_cell);
				_col_y = string(_id1.my_cell.y_cell);
				_col_txt1 = string(_arg1);		// new specie prefix
				_col_txt2 = string(_arg2);		// new specie code
				_col_txt3 = string(_arg3);		// parent specie code
//				_col_txt3 = specie_code_prefix_from_code(_arg3);		// parent specie prefix
				break;
			}
		}
		
		if _do_log {
			
			var current_sim_step =  variable_instance_exists(controller, "time") ? controller.time.current_sim_step : 0;
			var current_sim_month =  variable_instance_exists(controller, "time") ? controller.time.current_sim_month : 1;
			var current_sim_year =  variable_instance_exists(controller, "time") ? controller.time.current_sim_year : 1;
			
			
			_lines_buffer [_line] = 
					string(current_sim_step)									
					+ CSV_SEPARATOR
					+ string(current_sim_month)								
					+ CSV_SEPARATOR
					+ string(current_sim_year)
					+ CSV_SEPARATOR
					+ log_event_to_string(_event)
					+ CSV_SEPARATOR 
					+ _col_id1
					+ CSV_SEPARATOR
					+ _col_name
					+ CSV_SEPARATOR
					+ _col_trophic_level 
					+ CSV_SEPARATOR
					+ _col_specie
					+ CSV_SEPARATOR
					+ _col_id2
					+ CSV_SEPARATOR
					+ _col_x
					+ CSV_SEPARATOR
					+ _col_y
					+ CSV_SEPARATOR
					+ _col_num1
					+ CSV_SEPARATOR
					+ _col_num2
					+ CSV_SEPARATOR
					+ _col_txt1
					+ CSV_SEPARATOR
					+ _col_txt2
					+ CSV_SEPARATOR
					+ _col_txt3
					;
				
			if (_id1 == obj_gui.gui.creature_to_follow)
				show_debug_message("LOG:  "+string_replace_all(_lines_buffer[_line], ";", "  ;  "));
			
			//show_debug_message(_lines_buffer[_line]);
		
			_line++;
		
			// when buffer is full, write to disk and reset buffer
			if _line >= BUFFER_LINES {
				show_debug_message("Saving...");
				_log_write_buffer();
				_lines_buffer = [];
				_line = 0;
			}
		}
	}




	// --- write buffer to disk
	
	_log_write_buffer = function() {
		if obj_gui.options_log {
			for (var i=0; i< min( array_length(_lines_buffer), BUFFER_LINES); i++) {
				file_text_write_string(_file, _lines_buffer[i] + "\n");
			}
		}
	}


	// --- log close

	log_close = function() {
		if obj_gui.options_log {
			_log_write_buffer();
			file_text_close(_file);
			// why is working_directory showing strange value "y:\..."??
			show_debug_message("LOG -- File closed: "+working_directory+_filename );
		}
		
	}

	


}