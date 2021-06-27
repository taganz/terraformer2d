
// return 999999 if error

function family_get_area(family){

	switch(family) {
		
		case "fam_animal_tiny": return	1; break;
		case "fam_animal_small": return	2; break;
		case "fam_animal_medium": return 3; break;
		case "fam_animal_big": return	4; break;
		case "fam_plant_grass": return	0.1; break;
		case "fam_plant_bush": return	3; break;
		case "fam_tree_small": return	5; break;
		case "fam_tree_big": return		10; break;
		case "fam_crop": return		10; break;
		default:
			ASSERT(true, 0, "family_get_area invalid family: "+string(family));
			return 999999;
	}
}
