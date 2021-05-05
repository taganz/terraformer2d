// === main log event

function log_event(_event, _id1, _arg1, _arg2, _arg3) {
	
	
		// === main log switch option
		
		if controller.user_options.LOG_ALLOW_LOG == false
			return;
		
	
		
		// === init format fields

		// --- to add a field, add also heading in Log constructor

		var _col_id1 = "";
		var _col_name = "";
		var _col_trophic_level = "";
		var _col_specie = "";						
		var _col_id2 = "";
		var _col_x = "";
		var _col_y = "";
		var _col_num1 = "";
		var _col_num2 = "";
		var _col_num3 = "";
		var _col_txt1 = "";
		var _col_txt2 = "";
		var _col_txt3 = "";
		
		var _do_log = true;
		
	
		// === format fields
		
		switch(_event) {
			
			
#region === CREATURE EVENTS

			//case LOGEVENT.CREATURE_ADULT:
			case LOGEVENT.CREATURE_ANABOLISM:
			case LOGEVENT.CREATURE_BEEN_EATED:
			case LOGEVENT.CREATURE_BIOMASS:
			case LOGEVENT.CREATURE_BIOMASS_EAT:
			case LOGEVENT.CREATURE_BIOMASS_BODY:
			case LOGEVENT.CREATURE_BIOMASS_REPRODUCTION:
			case LOGEVENT.CREATURE_BIOMASS_RESERVE:
			case LOGEVENT.CREATURE_BORN:
			case LOGEVENT.CREATURE_CELL_PLANTS_AVAILABLE_WATER:
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
				if (controller.user_options.LOG_CREATURES_ALL
						//or (controller.user_options.LOG_CREATURES_FOLLOWING and _id1 == obj_gui.gui.creature_to_follow)) 
						or (controller.user_options.LOG_CREATURES_FOLLOWING and _id1.creature_log==true)) {
						
					ASSERT(_id1!=0, _id1, "log_event id1==0 event "+LOGEVENT_to_string(_event));
					
					// common 
					_col_id1 = string(_id1);
					_col_name = _id1.creature_log_name;
					_col_trophic_level = trophic_level_to_string(_id1.genome[GEN.TROPHIC_LEVEL]);
					_col_specie = string(_id1.genome[GEN.SPECIE_CODE]);
					
					if (_id1.my_cell != 0) {
						_col_x = string(_id1.my_cell.x_cell);
						_col_y = string(_id1.my_cell.y_cell);
					}
				
				
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
						_col_num1 = string((_arg2));		
					}
					if _event == LOGEVENT.CREATURE_REPRODUCTION {
						_col_id2 = string(_arg1);										// child id
						_col_num1 = string(sim_steps_to_years(_id1.structure.age));		// parent age years
						_col_num2 = string((_arg2));									// child biomass
					}
					if _event == LOGEVENT.CREATURE_EAT {
						_col_id2 = string(_arg1);
						_col_num1 = string((_arg2));		// biomass got
						_col_txt1 = string(_arg3);		// msg
					}
					if _event == LOGEVENT.CREATURE_BIOMASS {
						_col_num1 = string((_id1.structure.biomass));
						_col_txt1 = "kg"
					}
					if _event == LOGEVENT.CREATURE_BIOMASS_EAT {
						var _percent = (_arg1/_id1.structure.biomass);
						_col_num1 = string((_arg1));	
						if (_id1.structure.biomass > 0) {
							_col_num2 = string(_percent);
						}
						_col_txt1 = string(_percent)+"% biomass"
					}
					if _event == LOGEVENT.CREATURE_BIOMASS_BODY {
						var _percent = (_arg1/_id1.structure.biomass);
						_col_num1 = string((_arg1));	
						if (_id1.structure.biomass > 0) {
							_col_num2 = string(_percent);
						}
						_col_txt1 = string(_percent)+"% biomass"
					}
					if _event == LOGEVENT.CREATURE_BIOMASS_REPRODUCTION {
						var _percent = (_arg1/_id1.structure.biomass);
						_col_num1 = string((_arg1));	
						if (_id1.structure.biomass > 0) {
							_col_num2 = string(_percent);
						}
						_col_txt1 = string(_percent)+"% biomass"
					}
					if _event == LOGEVENT.CREATURE_BIOMASS_RESERVE {
						_col_num1 = string((_id1.structure._biomass_reserve_max));	
						if (_id1.structure._biomass_reserve_max != 0) {
							var _percent = _id1.structure.biomass_reserve/_id1.structure._biomass_reserve_max;
							_col_num2 = string(_percent);
							_col_txt1 = string(_percent)+"% reserve max"
						}
						else {
							var _percent = 0;
							_col_num2 = string(_percent);
							_col_txt1 = string(_percent)+" ERROR! reserve max == 0"
						}
					}
					
					if _event == LOGEVENT.CREATURE_CELL_PLANTS_AVAILABLE_WATER {
						_col_num1 = string(_arg1);
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
						_col_num1 = string((_arg1));	
					}
					if _event == LOGEVENT.CREATURE_ANABOLISM {
						_col_num1 = string((_arg1));
						_col_num2 = string_format((_id1.structure.biomass), 4, 1);
						_col_txt1 = _arg2;
					}
					if _event == LOGEVENT.CREATURE_CATABOLISM {
						_col_num1 = string((_arg1));
						_col_num2 = string_format((_id1.structure.biomass), 4, 1);
						_col_txt1 = _arg2;
					}
					if _event == LOGEVENT.CREATURE_TEMPERATURE {
						//_col_specie = "";
						_col_num1 = string(_arg1);							// T
						_col_num2 = string_format(_arg2, 5, 3);				// kt anabolism
						_col_num3 = string_format(_arg3, 5, 3);				// kt catabolism
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
				if controller.user_options.LOG_CREATURES_ALL
				//|| (controller.user_options.LOG_CREATURES_FOLLOWING and _id1 == obj_gui.gui.creature_to_follow) 
				||  (controller.user_options.LOG_CREATURES_FOLLOWING and _id1.creature_log==true) {
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
			case LOGEVENT.WORLD_SPAWNER:
				break;
				
#endregion

#region === SPECIE EVENTS

			case LOGEVENT.SPECIE_BORN: 
			case LOGEVENT.SPECIE_DEAD: 
			case LOGEVENT.SPECIE_NEW: 
			case LOGEVENT.SPECIE_GENOME:
			case LOGEVENT.SPECIE_GENOME_NUM: {
				if controller.user_options.LOG_SPECIES {
					if (_id1 != 0) {
						_col_id1 = string(_id1);
						_col_trophic_level = trophic_level_to_string(_id1.genome[GEN.TROPHIC_LEVEL]);
						_col_specie = string(_id1.genome[GEN.SPECIE_CODE]);			// specie
						if (_id1.my_cell != 0) {
							_col_x = string(_id1.my_cell.x_cell);
							_col_y = string(_id1.my_cell.y_cell);
						}
					}
					
					if _event == LOGEVENT.SPECIE_BORN {
						_col_num1 = string((_id1.structure.biomass));				// biomass
						_col_txt1 = climate_to_string(_id1.my_cell.climate);		// climate
						_col_txt2 = object_get_name(_id1.object_index);				// genus
					}
					
					if _event == LOGEVENT.SPECIE_DEAD {
						_col_num1 = string(_id1.structure.biomass);					// biomass
						_col_num2 = string(_id1.structure.age);						// age
						_col_num3 = string(_id1.structure.reproduction_count);		// reproduction times (not offspring!)
						_col_txt1 = climate_to_string(_id1.my_cell.climate);		// climate
						_col_txt2 = object_get_name(_id1.object_index);				// genus
						_col_txt3 = deadcause_to_string(_id1.structure.dead_cause);	// dead cause
					}
					if _event == LOGEVENT.SPECIE_NEW {
						_col_txt1 = string(_arg1);		// offspring specie code
						_col_txt2 = string(_arg2);		// parent specie code
						_col_txt3 = string(_arg3);		// parent specie code
					}
					if _event == LOGEVENT.SPECIE_GENOME {
						_col_specie = _arg1;		// specie
						_col_txt1 = _arg2;			// tag
						_col_txt2 = _arg3;			// string value
					}
					if _event == LOGEVENT.SPECIE_GENOME_NUM {
						_col_specie = _arg1;		// specie
						_col_txt1 = _arg2;			// tag
						_col_num1 = string(_arg3);	// num value
					}
					
				}
				else {
					_do_log = false;
				}
			}
			break;
			
#endregion
			
#region  === WORLD EVENTS
			
			case LOGEVENT.WORLD_POPULATION:	{
				_do_log = controller.user_options.LOG_WORLD;
				_col_id1 = "";
				_col_trophic_level = trophic_level_to_string(_arg1);    // trophic level
				_col_num1 = string(_arg2);								// individuals alive
			}
			break;
			
			
			//case LOGEVENT.WORLD_PROBE_NUTRIENTS:
			//case LOGEVENT.WORLD_PROBE_WATER:
			case LOGEVENT.WORLD_PROBE_PLANT_AVAILABLE_WATER:
			case LOGEVENT.WORLD_PROBE_RAIN_TEMP: 
			{
				_do_log = controller.user_options.LOG_WORLD;
				_col_name = _id1.probe_name;
				_col_x = string(_id1.my_cell.x_cell);
				_col_y = string(_id1.my_cell.y_cell);
				
				//if _event == LOGEVENT.WORLD_PROBE_NUTRIENTS
				//	_col_num1 = string((_arg1));
					
				if _event == LOGEVENT.WORLD_PROBE_PLANT_AVAILABLE_WATER {
					_col_num1 = string(_arg1);
					_col_txt1 = climate_to_string(_id1.my_cell.climate)
					}
										
				if _event == LOGEVENT.WORLD_PROBE_RAIN_TEMP {
					_col_txt1 = string_replace_all(_arg2, "\n", " - ");   // climate name
					_col_num1 = string(_arg1);    // rain 
					_col_num2 = string(_arg3);	  // temperature
				}
			}
			break;

#endregion

#region  === INFO EVENTS
	
			case LOGEVENT.INFO_PARAMETERS: {
				_col_txt1 = string(_id1);
			break;
			}
			case LOGEVENT.INFO_WARNING:
			case LOGEVENT.INFO_ERROR:
			case LOGEVENT.INFO_ERROR_ASSERT: {
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
		
#endregion

		}
		
		// === concatenate fields into line
		
		if _do_log {
			
			var current_sim_step =	variable_instance_exists(controller, "time") ? controller.time.current_sim_step : 0;
			var current_sim_month = variable_instance_exists(controller, "time") ? controller.time.current_sim_month : 1;
			var current_sim_year =  variable_instance_exists(controller, "time") ? controller.time.current_sim_year : 1;
			
			
			with controller.log {
			
				_lines_buffer [_line] = 
						string(current_sim_step)									
						+ CSV_SEPARATOR
						+ string(current_sim_month)								
						+ CSV_SEPARATOR
						+ string(current_sim_year)
						+ CSV_SEPARATOR
						+ LOGEVENT_to_string(_event)
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
						+ _col_num3
						+ CSV_SEPARATOR
						+ _col_txt1
						+ CSV_SEPARATOR
						+ _col_txt2
						+ CSV_SEPARATOR
						+ _col_txt3
						;
				
				//if (_id1 == obj_gui.gui.creature_to_follow)
				//	show_debug_message("log_event:  "+string_replace_all(_lines_buffer[_line], ";", "  ;  "));
			
				//show_debug_message(_lines_buffer[_line]);
		
		
				// === write line to disk
		
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


}