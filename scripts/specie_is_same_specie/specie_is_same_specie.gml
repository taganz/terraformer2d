// return true if all mutable gens are equal or have a difference < 10%
function specie_is_same_specie(genome1, genome2) {

	var same_specie = true;
	for (var i=GEN_FIRST_MUTABLE;i<GEN_NUM and same_specie;i++) {
		same_specie = (genome1[i] > genome2[i] * 0.6) and (genome1[i] < genome2[i] * 1.4) ;
	}
	return same_specie;
}