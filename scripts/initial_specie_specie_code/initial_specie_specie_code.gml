function initial_specie_specie_code(genome){
	
		var code = "";
		code = trophic_level_to_char(genome[GEN.TROPHIC_LEVEL])	// 1 char
				+initial_specie_to_string(genome[GEN.INITIAL_SPECIE]) // 2 chars
				+ "0"		// 1 char
				+ "0"		// 1 char
				+ "000"		// variant
		return code;
}