// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function kg_per_year_to_units(kg_year) {
	return kg_year * SIMULATION_UNITS_PER_KG  * TIME_SIM_STEPS_PER_MONTH * 12 ;
}