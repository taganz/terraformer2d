
if room != Room0 {
	
	// erase simulation bar
	draw_set_color(c_green);
	//draw_rectangle(controller.user_options.room_simulation_width, 0, controller.game_max_x-1, controller.game_max_y-1, false);
	draw_rectangle(0, 0, controller.game_max_x-1, controller.game_max_y-1, false);

}