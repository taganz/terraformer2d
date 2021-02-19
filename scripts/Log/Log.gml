/*

   Log class 
   - Outputs info to user about game events (creature born, dead,...)
   - One specific creature can be followed for output
   

*/


#macro BUFFER_LINES 5000
#macro SIM_LOG_FILE_NAME "SIM_LOG"




// == log event codes

enum LOGEVENT {
	CREATURE_BORN,
	CREATURE_BORN_INFO,
	CREATURE_BORN_INFO_NUM,
	CREATURE_ANABOLISM,					// obtained biomass during metabolism
	CREATURE_CATABOLISM,				// consumed biomass during metabolism
	CREATURE_ADULT,
	CREATURE_DEAD,
	CREATURE_DEAD_INFO,
	CREATURE_DEAD_INFO_NUM,
	CREATURE_STARVING,
	CREATURE_REPRODUCTION,
	CREATURE_BIOMASS,					// biomass at the end of step
	CREATURE_BIOMASS_DIGESTIVE,			// biomass at the end of step
	CREATURE_DECOMPOSE,
	CREATURE_DECOMPOSE_COMPLETED,
	CREATURE_EAT,
	CREATURE_BEEN_EATED,
	CREATURE_DEBUG,
	CREATURE_TEMPERATURE,				// at cell this month
	CREATURE_RAIN,						// at cell this month
	CREATURE_WATER_RECEIVED,			// plants
	SPECIE_NEW,							
	PROBE_NUTRIENTS,
	PROBE_WATER,					
	PROBE_TEMPERATURE,					
	SPAWNER,
	WORLD_POPULATION,				// total population for a trophic level
	PROBE_RAIN_TEMPERATURE,						
	WARNING,						// system warning
	ERROR,							// system error
	ERROR_ASSERT, 					// error from ASSERT function
	INFO_WORLD						// info about creature parameters
}



function log_event_to_string(_log_event) {
	var _msg = "??????";
	switch (_log_event) {
		case LOGEVENT.CREATURE_ADULT:			_msg = "CREATURE_ADULT"; break;
		case LOGEVENT.CREATURE_ANABOLISM:		_msg = "CREATURE_ANABOLISM"; break;
		case LOGEVENT.CREATURE_BEEN_EATED:		_msg = "CREATURE_BEEN_EATED"; break;
		case LOGEVENT.CREATURE_BIOMASS:			_msg = "CREATURE_BIOMASS"; break;
		case LOGEVENT.CREATURE_BIOMASS_DIGESTIVE: _msg = "CREATURE_BIOMASS_DIGESTIVE"; break;
		case LOGEVENT.CREATURE_BORN:			_msg = "CREATURE_BORN"; break;
		case LOGEVENT.CREATURE_BORN_INFO:			_msg = "CREATURE_BORN_INFO"; break;
		case LOGEVENT.CREATURE_BORN_INFO_NUM:			_msg = "CREATURE_BORN_INFO_NUM"; break;
		case LOGEVENT.CREATURE_CATABOLISM:		_msg = "CREATURE_CATABOLISM"; break;
		case LOGEVENT.CREATURE_DECOMPOSE:		_msg = "CREATURE_DECOMPOSE"; break;
		case LOGEVENT.CREATURE_DECOMPOSE_COMPLETED:	_msg = "CREATURE_DECOMPOSE_COMPLETED"; break;
		case LOGEVENT.CREATURE_DEAD:			_msg = "CREATURE_DEAD"; break;
		case LOGEVENT.CREATURE_DEAD_INFO:			_msg = "CREATURE_DEAD_INFO"; break;
		case LOGEVENT.CREATURE_DEAD_INFO_NUM:			_msg = "CREATURE_DEAD_INFO_NUM"; break;
		case LOGEVENT.CREATURE_EAT:				_msg = "CREATURE_EAT"; break;
		case LOGEVENT.CREATURE_RAIN:			_msg = "CREATURE_RAIN"; break;
		case LOGEVENT.CREATURE_REPRODUCTION:	_msg = "CREATURE_REPRODUCTION"; break;
		case LOGEVENT.CREATURE_STARVING:		_msg = "CREATURE_STARVING"; break;
		case LOGEVENT.CREATURE_TEMPERATURE:		_msg = "CREATURE_TEMPERATURE"; break;
		case LOGEVENT.CREATURE_WATER_RECEIVED:	_msg = "CREATURE_WATER_RECEIVED"; break;
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
	}
	return _msg;
}


// shorthands
#macro LOG		controller.log.log_simulation_event
#macro LOG_ID	controller.log.log_id						// <--- deprecated
#macro LOG_ID_SAMPLED controller.log.log_id_sampled			// <--- deprecated

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
			case LOGEVENT.CREATURE_ADULT:
			case LOGEVENT.CREATURE_ANABOLISM:
			case LOGEVENT.CREATURE_BEEN_EATED:
			case LOGEVENT.CREATURE_BIOMASS:
			case LOGEVENT.CREATURE_BIOMASS_DIGESTIVE:
			case LOGEVENT.CREATURE_BORN:
			case LOGEVENT.CREATURE_DEBUG: 
			case LOGEVENT.CREATURE_DEAD:
			case LOGEVENT.CREATURE_EAT:
			case LOGEVENT.CREATURE_DECOMPOSE:	
			case LOGEVENT.CREATURE_DECOMPOSE_COMPLETED:
			case LOGEVENT.CREATURE_CATABOLISM:
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
					_col_trophic_level = trophic_level_to_string(_id1.dna.genome[GEN.TROPHIC_LEVEL]);
					_col_specie = string(_id1.dna.genome[GEN.SPECIE_CODE]);
					_col_x = string(_id1.my_cell.x_cell);
					_col_y = string(_id1.my_cell.y_cell);
				
				
					if _event == LOGEVENT.CREATURE_ADULT {
						_col_txt1 = _arg1;
					}
					// id2, num1, txt1, txt2
					if _event == LOGEVENT.CREATURE_BORN {
						_col_txt1 = _id1.dna.genome[GEN.SPECIE_CODE];
					}
					// 
					if _event == LOGEVENT.CREATURE_BEEN_EATED {
						_col_id2 = string(_arg1);
						_col_num1 = string(units_to_kg(_arg2));		
					}
					if _event == LOGEVENT.CREATURE_REPRODUCTION {
						_col_id2 = string(_arg1);
						_col_num1 = string(units_to_kg(_arg2));		
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
					if _event == LOGEVENT.CREATURE_BIOMASS_DIGESTIVE {
						var _percent = (_arg1/_id1.structure.biomass*100) mod 100;
						//_col_specie = string(units_to_kg(_arg1));	
						//_col_num1 = string(_percent);
						_col_num1 = string(units_to_kg(_arg1));	
						_col_num2 = string(_percent);
						_col_txt1 = string(_percent)+"% biomass"
					}
					if _event == LOGEVENT.CREATURE_DEAD {
						_col_txt1 = string(deadcause_to_string(_arg1));		// dead cause
						_col_txt2 = string(_arg2);		// msg
					}
					if _event == LOGEVENT.CREATURE_DEBUG {
						_col_txt1 = _arg1;
					}
					if _event == LOGEVENT.CREATURE_DECOMPOSE {
						_col_num1 = string(units_to_kg(_arg1));	
					}
					if _event == LOGEVENT.CREATURE_ANABOLISM {
						_col_num1 = string(units_to_kg(_arg1));
						_col_txt1 = _arg2;
					}
					if _event == LOGEVENT.CREATURE_CATABOLISM {
						_col_num1 = string(units_to_kg(_arg1));
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
						_col_trophic_level = trophic_level_to_string(_id1.dna.genome[GEN.TROPHIC_LEVEL]);
						_col_specie = string(_id1.dna.genome[GEN.SPECIE_CODE]);
						_col_x = string(_id1.my_cell.x_cell);
						_col_y = string(_id1.my_cell.y_cell);
				
						if _event == LOGEVENT.CREATURE_BORN_INFO{
							_col_txt1 = _arg1;		// tag
							_col_txt2 = _arg2;		// value
						}
						if _event == LOGEVENT.CREATURE_BORN_INFO_NUM{
							_col_txt1 = _arg1;				// tag
							_col_num1 = string(_arg2);		// value
						}
						if _event == LOGEVENT.CREATURE_DEAD_INFO {
							_col_txt1 = _arg1;		// tag
							_col_txt2 = _arg2;		// value
						}
						if _event == LOGEVENT.CREATURE_DEAD_INFO_NUM{
							_col_txt1 = _arg1;				// tag
							_col_num1 = string(_arg2);		// value
						}
				}
				else
				{
					_do_log = false;
				}
				break;
			case LOGEVENT.SPAWNER:
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
					_col_trophic_level = trophic_level_to_string(_id1.dna.genome[GEN.TROPHIC_LEVEL]);
					_col_specie = string(_id1.dna.genome[GEN.SPECIE_CODE]);
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
			case LOGEVENT.INFO_WORLD: {
				if LOG_WORLD {
					_col_txt1 = string(_id1);
				}
				else
				{
					_do_log = false;
				}
				break;
			}
			case LOGEVENT.SPECIE_NEW: {
				_col_id1 = string(_id1);
				_col_trophic_level = trophic_level_to_string(_id1.dna.genome[GEN.TROPHIC_LEVEL]);
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
			
			var t1 =  variable_instance_exists(controller, "time") ? controller.time.current_sim_step : 0;
			var t2 =  variable_instance_exists(controller, "time") ? controller.time.current_sim_month : 0;
			var t3 =  variable_instance_exists(controller, "time") ? controller.time.current_sim_year : 0;
			
			
			_lines_buffer [_line] = 
					string(t1)
					+ CSV_SEPARATOR
					+ string(t2)
					+ CSV_SEPARATOR
					+ string(t3)
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

	
	// === creature is born

	creature_born = function(_id) {
		if (LOG_IF_SHIFT_PRESSED == true 
			&& keyboard_check(vk_shift)) || _id == obj_gui.gui.creature_to_follow {
				LOG_ID(_id, "Born");
				show_debug_message(log_text_creature(_id));
			}
	}
	
	
	// === creature is dead

	creature_dead = function (_id) {
		if (LOG_IF_SHIFT_PRESSED == true 
			&& keyboard_check(vk_shift)) || _id == obj_gui.gui.creature_to_follow {
				LOG_ID(_id, "Dead");
				show_debug_message(log_text_creature(_id));
			}
	}
	
	
	// === selected creature events log 
	
	// show message at output if 
	//	- creature is been followed
	//  - shift is pressed and this is allowed
	log_id = function (_id, _msg){
	
		if (LOG_IF_SHIFT_PRESSED == true 
			&& keyboard_check(vk_shift)) || _id == obj_gui.gui.creature_to_follow
			
			show_debug_message("Step "+string(controller.time.current_step)+" Creature "+string(_id)+ " age "+string(_id.structure.age) + ": " +_msg); 
	}
	
	
	// do log_id sometimes
	log_id_sampled = function(_id, _msg) {	
		if (_id.structure.age mod 50 == 0) {
			if (_id.structure.age >= 50 || _id.structure.age mod 10 == 0) {
				log_id(_id, _msg);
			}
		}
	}

	
	// === user pressed key to see world data
	
	log_screen_world = function () {

		if keyboard_check(vk_control) {
	
			draw_set_colour(c_red);
			//draw_set_font(fTextDebug);

			if (mouse_x>= 0 && mouse_y >= 0 
				&& mouse_x <controller.world.world_max_x && mouse_y <controller.world.world_max_y) {
					
				var _offset_print_to_left = mouse_x > 300 ? -300 : 0;
				//var _offset_print_to_left = mouse_x < 200 ? +300 : 0;
				var x_draw = mouse_x + _offset_print_to_left;
				var _offset_print_down = mouse_y > 500 ? -300 : 0;
				var y_draw = mouse_y + _offset_print_down;
				
				var _xx = floor(mouse_x/CELL_SIZE);
				var _yy = floor(mouse_y/CELL_SIZE);
				var _cell = controller.world.grid_cells[# _xx, _yy];
				//var climate = ds_grid_get(controller.world.grid_climate, _xx, _yy);
				//var nutrients = ds_grid_get(world.grid_nutrients, _xx, _yy);
				if _cell!=0 {
					draw_text(x_draw, y_draw, "Climate:"+climate_to_string(_cell.climate));
					y_draw+=32;
					draw_text(x_draw, y_draw, "Water:"+string(_cell.available_water));
					y_draw+=32;
					draw_text(x_draw, y_draw, "Water max:"+string(_cell.soil_available_water_max));
					y_draw+=32;
				}
				draw_text(x_draw, y_draw, "Pixels: "+string(mouse_x)+","+string(mouse_y)+" Grid: "+string(_xx)+","+string(_yy));
					y_draw+=32;
				draw_text(x_draw, y_draw, "Cell: "+controller.world.cell_to_string(mouse_x, mouse_y));
					y_draw+=32;
			
					
			}
		}
	}



	
	/*
	// === ASSERT
	
	assert = function(_exp, _id, _msg) {
		if _exp == false
			LOG(LOGEVENT.ERROR_ASSERT, _id, _msg);
	}
	*/	
}