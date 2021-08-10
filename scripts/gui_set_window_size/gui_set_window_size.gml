
function gui_set_window_size(){
		window_set_size( min(display_get_width(), ROOM_WIDTH), min(display_get_height(), ROOM_HEIGHT) );
		controller.game_max_x = window_get_width();
		controller.game_max_y = window_get_height();
		
		/*
		show_debug_message("*** display_get_width(): "+string(display_get_width()));
		show_debug_message("*** display_get_height(): "+string(display_get_height()));
		show_debug_message("*** window_get_width(): "+string(window_get_width()));
		show_debug_message("*** window_get_height(): "+string(window_get_height()));
		
		show_debug_message("*** room_get_name(room): "+string(room_get_name(room)));
		show_debug_message("*** room_height: "+string(room_height));
		show_debug_message("*** room_width: "+string(room_width));
		*/
		
}