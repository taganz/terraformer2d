function specie_code_y(genome){

	var formula_y = 0.75 * genome[GEN.TEMPERATURE_RANGE_MINIMUM] 
		+ 0.25 * (genome[GEN.TEMPERATURE_OPTIMAL] - genome[GEN.TEMPERATURE_RANGE_MINIMUM]);
	var y_offset = 0;
	if formula_y < 0		y_offset = 2;
	else if formula_y < 15	y_offset = 3;
	else if formula_y < 25	y_offset = 0;
	else					y_offset = 1;
	
	return y_offset;
}