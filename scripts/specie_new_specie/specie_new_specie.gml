// create new specie
// return new specie code

/*
	specie code is a 8 char string
	
    x0000 - specie prefix
		X   - trophic level: P, H, S
		00  - initial specie: 01, 02, 03,...
		0	- sprite sheet x offset
		0   - sprite sheet y offset - related to optimal temperature
	000  - specie variant 

*/
function specie_new_specie(genome){

	with controller.species {
		
		// increment last variant
		_genus_last_variant[genome[GEN.GENUS]] = _genus_last_variant[genome[GEN.GENUS]] + 1;
		
		
		var code = "";
		code = trophic_level_to_char(genome[GEN.TROPHIC_LEVEL])	// 1 char
				+genus_to_string(genome[GEN.GENUS]) // 2 chars
				+ "0"		// 1 char
				+ "0"		// 1 char
				+ string_replace_all(string_format(_genus_last_variant[genome[GEN.GENUS]],3, 0), " ", "0");		// variant
		return code;
				
	}

}