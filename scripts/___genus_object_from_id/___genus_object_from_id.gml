/*
	return asset index for id_genus
	precondition: an object with name==GEN.GENUS_OBJECT_NAME and parent "class_creature" must exist
*/
function ___genus_object_from_id(id_genus){

/*
show_debug_message("*** WARNING **** genus_object_from_id no esta acabat!!!!");
if id_genus == GENUS.PRIMARY_SMALL return obj_primary_small;
if id_genus == GENUS.PRIMARY_TINY return obj_primary_tiny;
if id_genus == GENUS.PRIMARY_TINY_2 return obj_primary_tiny_2;
if id_genus == GENUS.PRIMARY_TINY_3 return obj_primary_tiny_3;
return -1;
*/

	// wanted object. can not get genus var from a non instance
	var name_genus = genus_get_gen(id_genus, GEN.GENUS_OBJECT_NAME);
	
	// loop to all available objects. if object genus is ok return object
	for (var i=0;i<ds_list_size(controller.species._genus_object_names_list); i++) {
		var obj_name = ds_list_find_value(controller.species._genus_object_names_list, i);
		if obj_name == name_genus {
			var obj_index = asset_get_index(ds_list_find_value(controller.species._genus_object_names_list, i));
			return obj_index;
		}
			
	}
	ASSERT(false, 0, "genus_object_from_id - object "+ string(name_genus) +" not found for genus "+string(id_genus));
	return -1;

}