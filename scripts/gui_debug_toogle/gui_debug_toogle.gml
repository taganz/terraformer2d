
function gui_debug_toogle(){
	global.debug = !global.debug;
	
	layer_id = layer_get_id("tools");
	layer_set_visible(layer_id, global.debug);
	layer_id = layer_get_id("cell_grid");
	layer_set_visible(layer_id, global.debug);
	
}