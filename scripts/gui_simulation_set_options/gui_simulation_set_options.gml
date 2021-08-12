function gui_simulation_set_options(_simulation_id){



	switch(_simulation_id) {
		case 1:
			controller.user_options.simulation_room = OneClimateOneSoil;
			with controller.user_options {
				spawn_2_genus = GENUS.PRI_TINY;
				spawn_2_quantity = 3;
				spawn_2_distance_max = 0.2;
				spawn_3_genus = GENUS.PR_BUSH_4;
				spawn_3_quantity = 200;
				spawn_3_distance_max = 0.7;
		
				room_climate = CLIMATE.TROPICAL;
				room_soil_type = SOIL.LOAM;
			
				room_configurable_climate = true;   // only 0 tile cells will be replaced
				room_configurable_soil = true;		// only 0 tile cells will be replaced
			}
			break;
		case 2:
			controller.user_options.simulation_room = OneClimateOneSoil;
			controller.user_options.room_climate = CLIMATE.TROPICAL;
			controller.user_options.room_soil_type = SOIL.LOAM;
			with controller.user_options {
				spawn_2_genus = GENUS.SEC_TINY;
				spawn_2_quantity = 3;
				spawn_2_distance_max = 0.6;
		
				spawn_genus = GENUS.PRI_TINY;
				spawn_quantity = 30;
				spawn_distance_max = 0.6;

				spawn_3_genus = GENUS.PR_BUSH_4;
				spawn_3_quantity = 200;
				spawn_3_distance_max = 1;
			}
			break;
			
		// empty 
		
		case 3:
			controller.user_options.simulation_room = OneClimateOneSoil;
			controller.user_options.room_climate = CLIMATE.TROPICAL;
			controller.user_options.room_soil_type = SOIL.LOAM;
			with controller.user_options {
				spawn_2_genus = -1;
				spawn_2_quantity = 0;
				spawn_2_distance_max = 0.6;
		
				spawn_genus = GENUS.PRI_TINY_2;
				spawn_quantity = 0;
				spawn_distance_max = 0.6;

				spawn_3_genus = GENUS.PR_CROP_BUSH;
				spawn_3_quantity = 0;
				spawn_3_distance_max = 1;
			}
			break;
			
			
		case 4:
			controller.user_options.simulation_room = TestClimates;
			controller.user_options.room_climate = CLIMATE.TROPICAL;
			controller.user_options.room_soil_type = SOIL.LOAM;
			with controller.user_options {
				spawn_genus = GENUS.PR_BUSH_4;
				spawn_quantity = 100;
				spawn_distance_max = 1;

				spawn_2_genus = GENUS.PRI_TINY;
				spawn_2_quantity = 30;
				spawn_2_distance_max = 1;
		
				spawn_3_genus = -1;
				spawn_3_quantity = 0;
				spawn_3_distance_max = 1;
				
			}
			break;


			
		case 5:
			controller.user_options.simulation_room = ClimatesSquare;
			controller.user_options.room_climate = CLIMATE.TROPICAL;
			controller.user_options.room_soil_type = SOIL.LOAM;
			with controller.user_options {
				spawn_genus = GENUS.PR_BUSH_4;
				spawn_quantity = 100;
				spawn_distance_max = 1;

				spawn_2_genus = GENUS.PRI_TINY;
				spawn_2_quantity = 30;
				spawn_2_distance_max = 1;
		
				spawn_3_genus = -1;
				spawn_3_quantity = 0;
				spawn_3_distance_max = 1;
				
			}
			break;

		default:
			ASSERT(false, 0, "gui_set_simulation_parameters invalid _simulation_id "+string(_simulation_id));
	}
}