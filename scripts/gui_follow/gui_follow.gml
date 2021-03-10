// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gui_follow(_id){
		
	with obj_gui.gui {
		creature_to_follow = _id;
		show_debug_message("\nLOG activated following for creature "+string(_id));
	}	
}