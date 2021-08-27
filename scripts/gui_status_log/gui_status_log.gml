
function gui_status_log(){


	show_debug_message("*** GUI STATUS ***");
	show_debug_message("* Room: "+string(room_get_name(room)));
	show_debug_message("* Room size:    "+string(room_width)+"x"+string(room_height));
	show_debug_message("* Device display size: "+string(display_get_width())+"x"+string(display_get_height()));
	show_debug_message("* Game size:    "+string(window_get_width())+"x"+string(window_get_height()));
	show_debug_message("* Surface size: "+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface)));
	show_debug_message("* GUI size:     "+string(display_get_gui_width())+"x"+string(display_get_gui_height()));
	show_debug_message("* View port 0:   "+string(view_wport[0])+"x"+string(view_hport[0]));
	show_debug_message("*   Surface:    "+string(view_surface_id[0]));
	show_debug_message("*   Camera view position: "+string(camera_get_view_x(view_camera[0]))+"x"+string(camera_get_view_y(view_camera[0])));
	show_debug_message("*   Camera view area:     "+string(camera_get_view_width(view_camera[0]))+"x"+string(camera_get_view_height(view_camera[0])));
	show_debug_message("* View port 1:   "+string(view_wport[1])+"x"+string(view_hport[1]));
	show_debug_message("*   Surface:    "+string(view_surface_id[1]));
	show_debug_message("*   Camera view position: "+string(camera_get_view_x(view_camera[1]))+"x"+string(camera_get_view_y(view_camera[1])));
	show_debug_message("*   Camera view area:     "+string(camera_get_view_width(view_camera[1]))+"x"+string(camera_get_view_height(view_camera[1])));

	
	with controller.user_options {
		show_debug_message("* controller.user_options");
		show_debug_message("    User options Selected room: "+ room_get_name(simulation_room));
		show_debug_message("    User options Selected climate: "+ string(room_climate));
		show_debug_message("    User options Selected soil: "+ string(room_soil_type));
	}
	if room != Room0 and room != Room1 {
		with controller.world {
			show_debug_message("* controller.world");
			show_debug_message("     World size pixels (width_px/y): "+string(width_px)+" x "+string(height_px));
			show_debug_message("     World cell size (cell_size_px): "+string(cell_size_px ));
			show_debug_message("     World grid size (width_cells/y): "+string(width_cells)+" x "+string(height_cells));
			show_debug_message("     World pixels per meter: "+string(pixels_per_meter));
		}
	}
	
	

	show_debug_message("* obj_gui.game_gui");
	show_debug_message("    obj_gui.game_gui.game_width: "+string(obj_gui.game_gui.game_width));
	show_debug_message("    obj_gui.game_gui.game_height: "+string(obj_gui.game_gui.game_height));
	
	show_debug_message("    obj_gui.game_gui.simulation_width: "+string(obj_gui.game_gui.simulation_width));
	show_debug_message("    obj_gui.game_gui.simulation_height: "+string(obj_gui.game_gui.simulation_height));
	
}