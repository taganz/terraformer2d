// return specie code "x code" as integer
function specie_code_x(genome){
	return int64(string_char_at(genome[GEN.SPECIE_CODE], 4));
}