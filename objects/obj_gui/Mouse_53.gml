
// spawn creature when user clicks on simulation screen

if room!=Room0 and show_escape_screen == false {
	id_new = instance_create_layer(mouse_x, mouse_y, "Instances", controller.user_options.object_spawn_on_click);
			//controller.user_options.object_spawn_on_click_objects[controller.user_options.object_spawn_on_click]);
	show_debug_message("Created instance: "+string(id_new)+" and started following it");
	//gui_follow(id_new);
	
	// follow created creatures
	if controller.user_options.log_user_spawned_creatures {
		id_new.creature_log = true;
		id_new.creature_verbose = true;
	}
}