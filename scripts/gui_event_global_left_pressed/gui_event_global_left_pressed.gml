
function gui_event_global_left_pressed(){

	// spawn creature when user clicks on simulation screen

	with obj_gui {

		if room!=Room0 and show_escape_screen == false {

			// if user clicked inside world simulation area

			if world_is_inside_pixel(mouse_x, mouse_y) {
	
				// first spawn
	
				id_new = genus_instance_create(mouse_x, mouse_y, controller.user_options.genus_spawn_on_click);
				show_debug_message("Created instance: "+string(id_new));
	
				// follow created creatures
				if controller.user_options.log_user_spawned_creatures {
					show_debug_message("Started following: "+string(id_new));
					id_new.creature_log = true;
					id_new.creature_verbose = true;
				}
	
				// others
	
				if controller.user_options.genus_spawn_on_click_quantity > 1 {

					// distribute spawm depending on volume, maximum a quarter of area
					var _dist = lerp(0, 0.5, controller.user_options.genus_spawn_on_click_quantity/SPAWN_ON_CLICK_MAX);
					spawner_genus(genus_name_from_id(controller.user_options.genus_spawn_on_click), mouse_x, mouse_y, controller.user_options.genus_spawn_on_click_quantity -1, _dist, false);
		
				}
	

			}
		}
	}
}