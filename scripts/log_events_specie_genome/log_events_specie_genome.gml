// log all specie gens
function log_events_specie_genome(genome){
	
		// list gens
		for (var i=0;i<GEN_NUM;i++) {
			log_event(LOGEVENT.SPECIE_GENOME, 0, genome[GEN.SPECIE_CODE], string_format_zeroes(i,2,0) + " " + gen_to_string(i), string(genome[i]));
		}

}