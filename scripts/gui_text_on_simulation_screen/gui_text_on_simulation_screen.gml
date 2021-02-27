

function gui_text_on_simulation_screen(){
	
	//if controller.screen_initialized {
		
				
		var _t1 = "Month/Year: " + string(controller.time.current_sim_month)+"."+string(controller.time.current_sim_year) + "- sim step: " + string(controller.time.current_sim_step) + "- step: " + string(controller.time.current_step) 
				+ " fps: "+string(clamp(fps_real, 0, game_get_speed(gamespeed_fps)))
//				+ " sim_steps_per_step: "+string(ceil(controller.time.sim_steps_per_step))
				+ " steps_per_sim_step: "+string(ceil(controller.time.steps_per_sim_step))
				+ (controller.sim_paused ? " PAUSED" : "")
				;
		
		var _t2="Born: " + string(controller.world.creatures_born)
				+" Dead: " + string(controller.world.creatures_dead)
				+" Now: " + string(controller.world.creatures_live_now)
				+" Peak: " + string(controller.world.creatures_peak)
				;
		var _t3 = "Producers: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.PRODUCER])
				+" Cons primaries: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.PRIMARY])
				+" Cons secondaries: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.SECONDARY])
				;
		var _t4 = "Temperature increment: "+string(controller.world.climate_change_temperature_increment)+"ºC";

		
		//draw_set_font(fnt_hud);
		draw_set_color(c_black);
		draw_set_font(fnt_small);
		var _yy = 40;
		var _xx = 100;
		draw_text(_xx, _yy + 20, _t1);
		draw_text(_xx, _yy + 40, _t2);
		draw_text(_xx, _yy + 60, _t3);
		draw_text(_xx, _yy + 80, _t4);
		//draw_text(_xx, _yy + 100, KEYS_TEXT_LINE);

		// === seasons icon

		draw_sprite_ext(spr_seasons, controller.time.current_sim_month -1, 20, 10, 0.2, 0.2, 0, c_white, 0.5);

	//}
}