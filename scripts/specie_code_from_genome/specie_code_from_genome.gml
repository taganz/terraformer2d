/*
	specie code is a 8 char string
	
	X   - trophic level: P, H, S
	00  - genus: 01, 02, 03,...
	000  - specie variant, a sequential number for each new specie

*/
function specie_code_from_genome(genome){
	
		
	var code = trophic_level_to_char(genome[GEN.TROPHIC_LEVEL])	// 1 char
			+string_format_zeroes(genome[GEN.GENUS], 2, 0) // 2 chars
			+ string_format_zeroes(controller.species._genus_last_variant[genome[GEN.GENUS]],3, 0);		// variant
				
	return code;
				
		
}