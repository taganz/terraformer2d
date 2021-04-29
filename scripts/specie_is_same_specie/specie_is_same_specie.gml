// return true if all mutable gens are equal or have a difference < 10%
function specie_is_same_specie(genome1, genome2) {

	var same_specie = true;
	for (var i=GEN_FIRST_MUTABLE;i<GEN_NUM and same_specie;i++) {
		same_specie = (genome1[i] >= (genome2[i] * (1-RADIATION_GEN_MUTATION_MIN))) and (genome1[i] <= (genome2[i] * (1+RADIATION_GEN_MUTATION_MIN))) ;
		/*
		var debug1 = genome1[i];
		var debug2 = genome2[i];
		var debug21 = genome2[i]*0.6;
		var debug22 = genome2[i]*1.4;
		var ig1 = (genome1[i] > (genome2[i] * 0.6));
		var ig2 = (genome1[i] < (genome2[i] * 1.4));
		*/
		
	}
	return same_specie;
}