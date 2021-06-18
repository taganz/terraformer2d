// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function test_move_step(){
	if controller.time.current_step == 100 {
	
	show_debug_message("Position: "+string(x)+", "+string(y));
	
	show_debug_message("world_creature_move 12, 15");
	world_creature_move(id, 12, 15)
	show_debug_message("Position: "+string(x)+", "+string(y));
	
	show_debug_message("world_creature_move 15, 15");
	world_creature_move(id, 15, 15)
	show_debug_message("Position: "+string(x)+", "+string(y));
	
	show_debug_message("world_creature_move_to 150, 120, distance max 40");
	world_creature_move_to(id, 150, 120, 40)
	show_debug_message("Position: "+string(x)+", "+string(y));
	
	}
}