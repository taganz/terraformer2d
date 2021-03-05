// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function time_sim_faster(){
	with controller.time {
		if controller.sim_paused==false
			if steps_per_sim_step > 1
				steps_per_sim_step --;
	}
}