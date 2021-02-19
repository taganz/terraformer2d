function specie_code_x(genome){

	// char x

	var formula_x = (genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L]
					- genome[GEN.METABOLIC_RATE])
					* 10;
	var x_offset = 0;
	if formula_x < 0		x_offset = 2;
	else if formula_x < 1.5	x_offset = 3;
	else if formula_x < 2.5	x_offset = 0;
	else					x_offset = 1;
	
	return x_offset;

}