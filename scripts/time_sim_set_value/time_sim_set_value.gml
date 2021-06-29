/*
   set speed value. 1 = fastest, 10 = slowest
*/
function time_sim_set_value(_value){
	controller.time.steps_per_sim_step = clamp(_value, 1, 10);
}