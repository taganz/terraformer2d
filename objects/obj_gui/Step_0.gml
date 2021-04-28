// check if some creature is alive and suggest restart if not

if room != Room0 and show_escape_screen == false and controller.time.current_sim_step > 50 {
		
	gui_step_check_someone_alive();
}