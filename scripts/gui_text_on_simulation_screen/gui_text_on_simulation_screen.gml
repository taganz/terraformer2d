/*
   Write simulation information on top of the screen


*/

function gui_text_on_simulation_screen(){
	
				
		var _t1 = "Month: " + string(controller.time.current_sim_month)+"."+string(controller.time.current_sim_year)
				+ (controller.sim_paused ? " PAUSED" : "")
				//+ "- sim step: " + string(controller.time.current_sim_step) 
				//+ "- step: " + string(controller.time.current_step) 
				+ "  fps: "+string(clamp(fps_real, 0, game_get_speed(gamespeed_fps)))
				+ "  Speed: "+string(11 - ceil(controller.time.steps_per_sim_step))
				+ "  Spawn: "+genus_name_from_id(controller.user_options.genus_spawn_on_click)
				+ (controller.user_options.LOG_ALLOW_LOG ? " LOG" : "")
				+ "  T inc: "+string(controller.world.temperature_increment)+"ºC";
				;
		
		var _t2="Born: " + string(controller.world.creatures_born)
				+"  Dead: " + string(controller.world.creatures_dead)
				+"  Now: " + string(controller.world.creatures_live_now)
				+"  Peak: " + string(controller.world.creatures_peak)
				+" - Prod: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.PRODUCER])
				+"  Prim: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.PRIMARY])
				+"  Sec: "+string(controller.world.trophic_level_live_now[TROPHIC_LEVEL.SECONDARY])
				+" - Biomass: "+string(round(controller.world.biomass))
				;
		//var _t4 = "T inc: "+string(controller.world.temperature_increment)+"ºC";

		
		draw_set_color(c_black);
		draw_set_font(fnt_small);
		var _yy = controller.user_options.room_simulation_heigth + 10;
		var _xx = 110;
		draw_text(_xx, _yy + 20, _t1);
		draw_text(_xx, _yy + 40, _t2);
		//draw_text(_xx, _yy + 60, _t3);
		//draw_text(_xx, _yy + 80, _t4);
		
		// === seasons icon

		draw_sprite_ext(spr_seasons, controller.time.current_sim_month -1, 20, 10, 0.2, 0.2, 0, c_white, 0.5);

}