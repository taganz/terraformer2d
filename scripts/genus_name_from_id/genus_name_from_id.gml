/*
	returns human readable genus name for genus_id
	
*/
function genus_name_from_id(_genus_id){

	// loop to all names. 
	for (var i=1;i< GENUS._LENGTH_; i++) {
		if genus_get_gen(i, GEN.GENUS_ID) == _genus_id {
			return genus_get_gen(i, GEN.GENUS_NAME);
			
		}
	}
	ASSERT(false, 0, "genus_name_from_id - not found _genus_id="+ string(_genus_id));
	return -1;
}