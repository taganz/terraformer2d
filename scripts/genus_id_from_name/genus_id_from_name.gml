function genus_id_from_name(_name){

/*
show_debug_message("*** WARNING **** genus_id_from_name no esta acabat!!!!");
if _name == "Primary small" return GENUS.PRI_SMALL;
if _name == "Primary tiny" return GENUS.PRI_TINY;
if _name == "Primary tiny 2" return GENUS.PRI_TINY_2;
if _name == "Primary tiny 3" return GENUS.PRI_TINY_3;
return -1;
*/


	// loop to all genus. if thropic level ok add genus name to array
	for (var i=0;i< GENUS._LENGTH_; i++) {
		if genus_get_gen(i, GEN.GENUS_NAME) == _name {
			return i;
		}
	}
	ASSERT(false, 0, "genus_id_from_name invalid name: "+string(_name));
	return -1;
}