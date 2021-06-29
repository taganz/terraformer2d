/*
	_trophic_level == -1 for ALL trophic levels
*/
function spawner_multi(_trophic_level) {
	
	for (var i=0; i< GENUS._LENGTH_; i++) {
		if genus_trophic_level_from_id(i) == _trophic_level or _trophic_level == -1 {
			spawner_genus(genus_name_from_id(i), 5, 300, 0);
		}
	}

}