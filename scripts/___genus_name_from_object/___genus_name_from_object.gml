/*
	returns human readable genus name for object index
	
*/
function ___genus_name_from_object(_id_object){

/*
show_debug_message("*** WARNING **** genus_name_from_object no esta acabat!!!!");
if _id ==  obj_primary_small return "Primary small";
if _id == obj_primary_tiny return "Primary tiny" ;
if _id == obj_primary_tiny_2 return "Primary tiny 2" ;
if _id == obj_primary_tiny_3  return "Primary tiny 3";
return -1;
*/


	//var arr = array_create(0, noone);
	// loop to all names. 
	for (var i=1;i< GENUS._LENGTH_; i++) {
		if genus_get_gen(i, GEN.GENUS_OBJECT_NAME) == object_get_name(_id_object) {
			return genus_get_gen(i, GEN.GENUS_NAME);
			
		}
	}
	ASSERT(false, 0, "genus_name_from_object - object not found"+ string(_id_object));
	return -1;
}