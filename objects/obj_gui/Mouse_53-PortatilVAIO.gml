
// spawn creature when user clicks on simulation screen

if room!=Room0 and show_escape_screen == false {
	id_new = instance_create_layer(mouse_x, mouse_y, "Instances", 
			options_gui.object_spawn_on_click_objects[options_gui.object_spawn_on_click]);
	show_debug_message("Created instance: "+string(id_new)+" and started following it");
	//gui_follow(id_new);
	
	// follow created creatures
	if obj_gui.options_log.log_user_spawned_creatures {
		id_new.creature_log = true;
	}
}