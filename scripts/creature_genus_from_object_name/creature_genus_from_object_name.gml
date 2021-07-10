
function creature_genus_from_object_name(){

	switch(object_get_name(id)) {
	
		case "obj_crop_bush":		return GENUS.PR_CROP_BUSH;
		case "obj_plant_artic":		return GENUS.PR_BUSH_ARTIC;
		case "obj_plant_bush":		return GENUS.PR_BUSH;
		case "obj_plant_bush_2":	return GENUS.PR_BUSH_2;
		case "obj_plant_bush_3":	return GENUS.PR_BUSH_3;
		case "obj_plant_bush_4":	return GENUS.PR_BUSH_4;
		case "obj_plant_bush_5":	return GENUS.PR_BUSH_5;
		case "obj_plant_desert":	return GENUS.PR_BUSH_DESERT;
		case "obj_tree":			return GENUS.PR_TREE_1;
		case "obj_tree_apple":		return GENUS.PR_TREE_2;
		case "obj_tree_continental": return GENUS.PR_TREE_3;
		case "obj_tree_mediterranean": return GENUS.PR_TREE_4;
		case "obj_tree_tropical":	return GENUS.PR_TREE_5;
		case "obj_primary_small":	return GENUS.PRI_SMALL;
		case "obj_primary_tiny":	return GENUS.PRI_TINY;
		case "obj_primary_tiny_2":	return GENUS.PRI_TINY_2;
		case "obj_primary_tiny_3":	return GENUS.PRI_TINY_3;
		case "obj_secondary_medium": return GENUS.SEC_MEDIUM;
		case "obj_secondary_small":	return GENUS.SEC_SMALL;
		default:
			log_error("creature_genus_from_object_name genus not set for object name "+string(object_get_name(id))+ " assigning GENUS.PR_BUSH");
			return GENUS.PR_BUSH;
	}

}