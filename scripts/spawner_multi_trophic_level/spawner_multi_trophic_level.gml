/*
	_trophic_level == -1 for ALL trophic levels
*/
function spawner_multi_trophic_level(_trophic_level) {
	
	var _quantity = -1;
	var _distance = 1;
	var _radiation = controller.world.radiation;
	
	switch(_trophic_level) {
		case TROPHIC_LEVEL.PRODUCER:
			_quantity = SPAWNER_RANDOM_PRODUCER;
			break;
		case TROPHIC_LEVEL.PRIMARY:
			_quantity = SPAWNER_RANDOM_PRIMARY;
			break;
		case TROPHIC_LEVEL.SECONDARY:
			_quantity = SPAWNER_RANDOM_SECONDARY;
			break;
	}
	
	for (var i=1; i< GENUS._LENGTH_; i++) {
		if genus_trophic_level_from_id(i) == _trophic_level or _trophic_level == -1 {
			spawner_genus(genus_name_from_id(i), -1, -1,  _quantity, _distance, _radiation);
		}
	}

}