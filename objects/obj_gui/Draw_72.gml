/// @description Erase simulation bar

if room != Room0 {
	draw_set_color(c_green);
	draw_rectangle(0, 0, controller.game_max_x-1, controller.game_max_y-1, false);
}