/*
	_trophic_level == -1 for ALL trophic levels
*/
function spawner_multi_trophic_level(_trophic_level) {
	
	var _quantity = 10;
	var _distance = 1;
	var _radiation = 0;
	
	for (var i=1; i< GENUS._LENGTH_; i++) {
		if genus_trophic_level_from_id(i) == _trophic_level or _trophic_level == -1 {
			spawner_genus(genus_name_from_id(i), -1, -1,  _quantity, _distance, _radiation);
		}
	}

}