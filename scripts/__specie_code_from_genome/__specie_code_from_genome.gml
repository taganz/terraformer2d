/*
	specie code is a 8 char string
	
    x0000 - specie prefix
		X   - trophic level: P, H, S
		00  - initial specie: 01, 02, 03,...
		0	- sprite sheet x offset
		0   - sprite sheet y offset - related to optimal temperature
	000  - specie variant 

*/

/*

function specie_code_from_genome(_genome){
			
	var code = "";
	code = trophic_level_to_char(_genome[GEN.TROPHIC_LEVEL])	// 1 char
			+genus_to_string(_genome[GEN.GENUS]) // 2 chars
			+ _get_code_x(_genome)		// 1 char
			+ _get_code_y(_genome)		// 1 char
			+"000";						// variant
	return code;

}


function _get_code_x(genome){
	
	var code = 0;
	
	// char x

	var k0 = (genome[GEN.GENUS], GEN.BIOMASS_ADULT)
				* (genome[GEN.GENUS], GEN.KC_METABOLIC_RATE);
	var k1 = genome[GEN.BIOMASS_ADULT]* genome[GEN.KC_METABOLIC_RATE];
	var variation = k1/k0 - 1;
	
	if variation < -0.6			code = 0;
	else if variation < -0.2	code = 1;
	else if variation < 0.2		code = 2;
	else if variation < 0.6		code = 3;
	else						code = 4;
	
	return string(code);

}


// char y

function _get_code_y(genome){

	var code = 0;
	
	// initial specie code
	var initial_specie_value = (genome[GEN.GENUS], GEN.TEMPERATURE_OPTIMAL);
	// variation 
	var variation = genome[GEN.TEMPERATURE_OPTIMAL]/initial_specie_value - 1;
	// y depends on variation
	if variation < -0.6			code = 0;
	else if variation < -0.2	code = 1;
	else if variation < 0.2		code = 2;
	else if variation < 0.6		code = 3;
	else						code = 4;
	
	return string(code);

}


*/