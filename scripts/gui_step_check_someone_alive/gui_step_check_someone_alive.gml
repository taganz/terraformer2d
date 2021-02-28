// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function gui_step_check_someone_alive(){

	if obj_gui.warning_no_creature_alive_issued == false {
		if controller.world.creatures_live_now == 0 {
			if show_question("No creature alive. Restart?") {
				game_restart();
			};
			obj_gui.warning_no_creature_alive_issued = true;
		}
	}
}