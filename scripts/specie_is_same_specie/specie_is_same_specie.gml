// specie is different if at least SPECIE_CHANGE_GEN_COUNT mutable gens have a difference > SPECIE_CHANGE_GEN_RANGE
function specie_is_same_specie(genome1, genome2) {

	var gen_change = 0;
	for (var i=GEN._SPECIE_MUTABLE_GENS_FOLLOWING_ + 1; i<GEN._LENGTH_ and gen_change < 3; i++) {
		if (genome1[i] < (genome2[i] * (1-SPECIE_CHANGE_GEN_RANGE)))  
			or (genome1[i] > (genome2[i] * (1+SPECIE_CHANGE_GEN_RANGE))) {
			gen_change++;
		}
		
		/*
		var debug1 = genome1[i];
		var debug2 = genome2[i];
		var debug21 = genome2[i]*0.6;
		var debug22 = genome2[i]*1.4;
		var ig1 = (genome1[i] > (genome2[i] * 0.6));
		var ig2 = (genome1[i] < (genome2[i] * 1.4));
		*/
		
	}
	return gen_change < SPECIE_CHANGE_GEN_COUNT;
}