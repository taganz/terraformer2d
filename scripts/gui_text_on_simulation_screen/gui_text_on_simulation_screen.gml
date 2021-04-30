/*
   Write simulation information on top of the screen


*/

function gui_text_on_simulation_screen(){
	
				
		var _t1 = "Month: " + string(controller.time.current_sim_month)+"."+string(controller.time.current_sim_year)
				+ (controller.sim_paused ? " PAUSED" : "")
				//+ "- sim step: " + string(controller.time.current_sim_step) 
				//+ "- step: " + string(controller.time.current_step) 
				+ "  fps: "+string(clamp(fps_real, 0, game_get_speed(gamespeed_fps)))
				+ "  Speed: "+string(ceil(controller.time.steps_per_sim_step))
				+ "  Spawn: "+options_gui.object_spawn_on_click_options[options_gui.object_spawn_on_click]
				+ (obj_gui.options_log.LOG_ALLOW_LOG ? " LOG" : "")
				+ "  T inc: "+string(controller.world.climate_change_temperature_increment)+"ºC";
				;
		
		var _t2="Born: " + string(controller.world.creatures_born)
				+"  Dead: " + string(controller.world.creatures_dead)
				+"  Now: " + string(controller.world.creatures_live_now)
				+"  Peak: " + string(controller.world.creatures_peak)
				+" -  Producers: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.PRODUCER])
				+"  Primaries: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.PRIMARY])
				+"  Secondaries: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.SECONDARY])
				;
		//var _t4 = "T inc: "+string(controller.world.climate_change_temperature_increment)+"ºC";

		
		draw_set_color(c_black);
		draw_set_font(fnt_small);
		var _yy = 30;
		var _xx = 110;
		draw_text(_xx, _yy + 20, _t1);
		draw_text(_xx, _yy + 40, _t2);
		//draw_text(_xx, _yy + 60, _t3);
		//draw_text(_xx, _yy + 80, _t4);
		
		// === seasons icon

		draw_sprite_ext(spr_seasons, controller.time.current_sim_month -1, 20, 10, 0.2, 0.2, 0, c_white, 0.5);

}