/*
function _specie_code_new(genome){

	with controller.species {
		
		// increment last variant
		_genus_last_variant[genome[GEN.GENUS]] = _genus_last_variant[genome[GEN.GENUS]] + 1;	
		
		var code = trophic_level_to_char(genome[GEN.TROPHIC_LEVEL])	// 1 char
				+string_format_zeroes(genome[GEN.GENUS], 2, 0) // 2 chars
				+ string_format_zeroes(_genus_last_variant[genome[GEN.GENUS]],3, 0);		// variant
				
		return code;
				
	}
	
}
*/