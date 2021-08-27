
function gui_step_check_someone_alive(){

	if obj_gui.game_gui.warning_no_creature_alive_issued == false {
		
		if controller.world.creatures_live_now == 0 {
			show_message("No creature alive. Simulation paused");
			controller_set_paused(true);
			obj_gui.game_gui.warning_no_creature_alive_issued = true;
		}
				
	}
}