
// move creature to destination point a maximum distance
// stop if arrived at point
//
// if _distance_max_to_move == -1  --> no distance maximum

function world_creature_move_to(_id, _xTo, _yTo, _distance_max_to_move){

	// if destination point is closer than max distance to move, get there
	if  _distance_max_to_move == -1 or _distance_max_to_move > point_distance(_id.x, _id.y, _xTo, _yTo) {
		var _xx = _xTo;
		var _yy = _yTo;
	}
	else {
		var _dir = point_direction(_id.x, _id.y, _xTo, _yTo);
		var _xx = _id.x + lengthdir_x(_distance_max_to_move, _dir);
		var _yy = _id.y + lengthdir_y(_distance_max_to_move, _dir);
	}
	world_creature_move(_id, _xx, _yy);

}
