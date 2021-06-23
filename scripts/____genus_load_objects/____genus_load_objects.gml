
function ____genus_load_objects(){

	var list_objects = ds_list_create();
	var _object_index=0;
	while (object_exists(_object_index) == 1) {
		
	    if object_is_ancestor(_object_index, class_creature) {
			var name_object = object_get_name(_object_index);
			show_debug_message("object "+string(_object_index)+": "+name_object);
		    ds_list_add(list_objects,name_object);
		}
	    _object_index ++
    }


	return list_objects;

}