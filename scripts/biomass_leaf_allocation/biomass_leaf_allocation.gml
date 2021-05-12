/*
leaf allocation = 
	dna metabolic rate / dna anabolim biomass per water l 
	/ dna evotranspiration factor / leaf m2 per kg / kg water per mm per m2


	return -1 if invalid parameters (creature can not live)

*/
function biomass_leaf_allocation(my_id){

	
	var _LMFa = my_id.genome[GEN.KC_METABOLIC_RATE]
				/ my_id.genome[GEN.KA_ANABOLISM_FACTOR]
				/ my_id.genome[GEN.EVOTRANSPIRATION_FACTOR]
				/ LEAF_M2_PER_KG;


	// smaller than 0.01 will not show correctly in statistics
	ASSERT((_LMFa >= 0.01 && _LMFa < 0.99), my_id, "biomass_leaf_allocation Invalid LMFa="+string_format(_LMFa, 6, 4)+" creature "+string(my_id));  
	
	if _LMFa < 0.01 or _LMFa >= 0.99 {
		_LMFa = -1;
	}
	
	return _LMFa;
}