


function spawner_random_3_trophic_levels(){

	var _distance = 1;
	var _radiation = controller.world.radiation;

	spawner_genus(genus_name_from_id(genus_get_random(TROPHIC_LEVEL.PRODUCER)), -1, -1,  SPAWNER_RANDOM_PRODUCER, _distance, _radiation);
	spawner_genus(genus_name_from_id(genus_get_random(TROPHIC_LEVEL.PRIMARY)), -1, -1,  SPAWNER_RANDOM_PRIMARY, _distance, _radiation);
	spawner_genus(genus_name_from_id(genus_get_random(TROPHIC_LEVEL.SECONDARY)), -1, -1,  SPAWNER_RANDOM_SECONDARY, _distance, _radiation);
	
}


