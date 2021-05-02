/*

	Stores user options
	
	Modified by obj_gui and consumed by controller 
	
*/

function User_options() constructor {

	
	climate_replace = -1;			// if > 0 all climate tiles will be replaced with this value
	soil_type_replace = -1;			// if > 0 all soil tiles will be replaced with this value


	object_spawn_on_click = 8;
	
	object_spawn_on_click_options = [
									"obj_plant_tree"
									, "obj_tree_tropical"
									, "obj_tree_continental"
									, "obj_tree_continental_2"
									, "obj_plant_desert"
									, "obj_plant_bush"
									, "obj_plant_bush_2"
									, "obj_plant_artic"
									, "obj_primary_small"
									, "obj_primary_tiny" 
									, "obj_secondary_small"
									];
	
	object_spawn_on_click_objects = [
									obj_plant_tree
									, obj_tree_tropical
									, obj_tree_continental
									, obj_tree_continental_2
									, obj_plant_desert
									, obj_plant_bush
									, obj_plant_bush_2
									, obj_plant_artic
									, obj_primary_small 
									, obj_primary_tiny 
									, obj_secondary_small
									];

}



