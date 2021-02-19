/*
	prefix
		- trophic level
		- initial specie
		- x
		- y

*/

function specie_code_prefix(genome){

	var code = "";

	//  == trophic level
	
	code = trophic_level_to_char(genome[GEN.TROPHIC_LEVEL]);
	
	// == initial specie
	
	code += string(genome[GEN.INITIAL_SPECIE]);
	
	// == sprite x
			
	code += string(specie_code_x(genome));

	// == sprite y
		
	code += string(specie_code_y(genome));
	

	return code;
}