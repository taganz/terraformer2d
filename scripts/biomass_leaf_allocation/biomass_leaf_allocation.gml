/*
leaf allocation = 
	dna metabolic rate / dna anabolim biomass per water l 
	/ dna evotranspiration factor / leaf m2 per kg / kg water per mm per m2

*/
function biomass_leaf_allocation(my_id){

	
	var _LMFa = my_id.genome[GEN.KC_METABOLIC_RATE]
				/ my_id.genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L]
				/ my_id.genome[GEN.EVOTRANSPIRATION_FACTOR]
				/ LEAF_M2_PER_KG;


	// smaller than 0.01 will not show correctly in statistics
	ASSERT((_LMFa > 0.01 && _LMFa < 0.99), my_id, "biomass_leaf_allocation Invalid LMFa="+string(_LMFa)+" creature "+string(my_id));  
	_LMFa = clamp(_LMFa, 0.01, 0.99);

	return _LMFa;
}