// nothing else to do that doing cicles around home
function brain_wander(_id){

	if _id.creature_log
		var breakpoint = 1;

	var _distance_home = point_distance(_id.brain.home_x, _id.brain.home_y, _id.x, _id.y );
	var _angle_home = point_direction(_id.brain.home_x, _id.brain.home_y, _id.x, _id.y );
	
	// to close to walk circles, get some distance from home
	if _distance_home < WANDER_MINIMUM_DISTANCE_HOME {
		var _xTo = _id.x + lengthdir_x(_id.structure.speed_wander_px, _angle_home); 	
		var _yTo = _id.y + lengthdir_y(_id.structure.speed_wander_px, _angle_home); 	
		world_creature_move_to(_id, _xTo, _yTo, _id.structure.speed_wander_px )
	}
	else {
		// walk circles
		var _xTo = _id.x + lengthdir_x(_id.structure.speed_wander_px, _angle_home + 90); 	
		var _yTo = _id.y + lengthdir_y(_id.structure.speed_wander_px, _angle_home + 90); 	
		world_creature_move_to(_id, _xTo, _yTo, _id.structure.speed_wander_px )
	}
}