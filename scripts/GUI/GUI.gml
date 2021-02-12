// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GUI() constructor{
	
	
	creature_to_follow = LOG_CREATURE_TO_FOLLOW;
	showing_debug_data_for_creature = -1;
	
	
		
	follow = function(_id) {
		creature_to_follow = _id;
		show_debug_message("\nLOG activated following for creature "+string(_id));
	}	


// === user press shift to see creature data
	
	// shows info if shift is pressed over creature 
	// and no other creature is doing this
	// if "Q" is pressed, log activation for this creature is activated
	
	// DEV - modifico per a que es pugui cridar des de GUI detectar en temps real sobre quina criatura tenim el mouse
	show_creature_info_screen = function() {

		if keyboard_check(vk_shift) {
		
			var _id = collision_point(mouse_x, mouse_y, class_creature, false, true);
		
			if _id != noone 
				&&  (showing_debug_data_for_creature == -1 or showing_debug_data_for_creature == _id) {
							
		
					//var _offset_print_to_left = mouse_x > 400 ? -300 : 0;
					//var _offset_print_down = mouse_y > 400 ? -300 : 0;
					//draw_text(_id.x + _offset_print_to_left, _id.y+30 + _offset_print_down, log_text_creature(_id));
					draw_text(50, 200, log_text_creature(_id));
					showing_debug_data_for_creature = _id;
		
					// if q is pressed, activate log for this creature
					if (keyboard_check_pressed(ord(KEY_ACTIVATE_LOG_CREATURE_IN_SCREEN))) {
						follow(_id);
					}
			}
			else {
				// reset
				showing_debug_data_for_creature = -1;
			}
		}
	}	

}