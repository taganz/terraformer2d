// return an array of genus names for selected trophic level
// if trophic_level == -1, return all 
function genus_get_names_array(trophic_level){

	//show_debug_message("*** WARNING **** genus_get_names_array no esta acabat!!!!");
	//return ["Primary small","Primary tiny", "Primary tiny 2" , "Primary tiny 3"];	
	
	var arr = array_create(0, noone);
	// loop to all genus. if thropic level ok add genus name to array
	for (var i=1;i< GENUS._LENGTH_; i++) {
		if trophic_level == -1 or genus_get_gen(i, GEN.TROPHIC_LEVEL) == trophic_level {
			array_push(arr, genus_get_gen(i, GEN.GENUS_NAME));
		}
	}
	return arr;
}