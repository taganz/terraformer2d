/*
	specie code is a 8 char string
	
    x0000 - specie prefix
		X   - trophic level: P, H, S
		00  - initial specie: 01, 02, 03,...
		0	- sprite sheet x offset
		0   - sprite sheet y offset
	000  - specie variant 

*/
function specie_code_from_genome(_genome){
			
	var code = "";
	code = trophic_level_to_char(_genome[GEN.TROPHIC_LEVEL])	// 1 char
			+initial_specie_to_string(_genome[GEN.INITIAL_SPECIE]) // 2 chars
			+ _get_code_x(_genome)		// 1 char
			+ _get_code_y(_genome)		// 1 char
			+"000";						// variant
	return code;

}


function _get_code_x(genome){

	// char x

	var formula_x = (genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L]
					- genome[GEN.KC_METABOLIC_RATE])
					* 10;
	var x_offset = 0;
	if formula_x < 0		x_offset = 2;
	else if formula_x < 1.5	x_offset = 3;
	else if formula_x < 2.5	x_offset = 0;
	else					x_offset = 1;
	
	return string(x_offset);

}



function _get_code_y(genome){

	// char y

	var formula_x = (genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L]
					- genome[GEN.KC_METABOLIC_RATE])
					* 10;
	var x_offset = 0;
	if formula_x < 0		x_offset = 2;
	else if formula_x < 1.5	x_offset = 3;
	else if formula_x < 2.5	x_offset = 0;
	else					x_offset = 1;
	
	return string(x_offset);

}