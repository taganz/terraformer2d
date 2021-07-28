// return a random genus from a given trophic_level
function genus_get_random(_trophic_level) {
	
	var seed = irandom_range(1, GENUS._LENGTH_);
	for (var i=seed; i<seed+GENUS._LENGTH_;i++) {
		var _genus = i mod GENUS._LENGTH_ + 1;
		if genus_get_gen( _genus, GEN.TROPHIC_LEVEL) == _trophic_level {
			show_debug_message("genus_get_random "+string(_trophic_level)+": "+string(_genus));
			return _genus;
		}
	}
	ASSERT(false, 0, "genus_get_random");
	return -1;

}