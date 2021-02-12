var _t1 = "Month/Year: " + string(time.current_sim_month)+"."+string(time.current_sim_year) + "- sim step: " + string(time.current_sim_step) + "- step: " + string(time.current_step) 
		+ " fps: "+string(clamp(fps_real, 0, game_get_speed(gamespeed_fps)))
		+ " sim_steps_per_step: "+string(ceil(controller.time.sim_steps_per_step))
		+ (controller.sim_paused ? " PAUSED" : "")
		;
		
var _t2="Born: " + string(world.creatures_born)
		+" Dead: " + string(world.creatures_dead)
		+" Now: " + string(world.creatures_live_now)
		+" Peak: " + string(world.creatures_peak)
		;
var _t3 = "Producers: "+string(world.trophic_level_live_now[TROPHIC_LEVEL.PRODUCER])
		+" Cons primaries: "+string(world.trophic_level_live_now[TROPHIC_LEVEL.PRIMARY])
		+" Cons secondaries: "+string(world.trophic_level_live_now[TROPHIC_LEVEL.SECONDARY])
		;

		
draw_set_color(c_black);
draw_text(20, 20, _t1);
draw_text(20, 40, _t2);
draw_text(20, 60, _t3);
draw_text(20, 0, KEYS_TEXT_LINE);

draw_sprite_ext(spr_seasons, time.current_sim_month -1, 20, 10, 0.2, 0.2, 0, c_white, 0.5);
