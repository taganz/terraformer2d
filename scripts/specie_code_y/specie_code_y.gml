/*
	returns a number 0..4
	depends on water

*/
function specie_code_y(genome){

	var gen = genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L];
	var ret = 0;
	if gen < 0.2		ret = 0;
	else if gen < 0.3	ret = 1;
	else if gen < 0.4	ret = 2;
	else				ret = 3;
			
	return ret;

}
/*
	var formula_y = 0.75 * genome[GEN.TEMPERATURE_RANGE] 
		+ 0.25 * (genome[GEN.TEMPERATURE_OPTIMAL] - genome[GEN.TEMPERATURE_RANGE]);
	var y_offset = 0;
	if formula_y < 0		y_offset = 2;
	else if formula_y < 15	y_offset = 3;
	else if formula_y < 25	y_offset = 0;
	else					y_offset = 1;
	
	return y_offset;
*/
	
