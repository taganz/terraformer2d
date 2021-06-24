// check all objects exists
function ___genus_check_objects_exist(){
		for (var i=0;i<GENUS._LENGTH_;i++) {
			var _obj = genus_get_gen(i, GEN.DEPRECATED_GENUS_OBJECT);
			if ds_list_find_index(controller.species._genus_object_names_list, _obj) == -1 {
				log_error("Object "+string(_obj)+" not found for GENUS "+string(i));
			}
		}
	
	

}