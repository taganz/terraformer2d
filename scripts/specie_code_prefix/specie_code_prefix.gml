// return specie code prefix from a genome
function specie_code_prefix(genome){
	return string_copy(specie_code_from_genome(genome), 1, 5);
}