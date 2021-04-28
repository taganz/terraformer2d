function _genus_specie_code(genome){
	
		var code = "";
		code = trophic_level_to_char(genome[GEN.TROPHIC_LEVEL])	// 1 char
				+genus_to_string(genome[GEN.GENUS]) // 2 chars
				+ "0"		// 1 char
				+ "0"		// 1 char
				+ "000"		// variant
		return code;
}