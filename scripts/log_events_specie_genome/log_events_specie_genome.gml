// log mutable specie gens
function log_events_specie_genome(genome){
	
		// list gens
		for (var i=GEN._SPECIE_MUTABLE_GENS_FOLLOWING_ + 1;i<GEN._LENGTH_;i++) {
			log_event(LOGEVENT.SPECIE_GENOME, 0, genome[GEN.SPECIE_CODE], string_format_zeroes(i,2,0) + " " + gen_to_string(i), string(genome[i]));
		}

}