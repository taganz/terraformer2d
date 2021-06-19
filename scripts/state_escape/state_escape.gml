
function state_escape(_id){

	with _id.brain {
		
		// === precondition
		
		ASSERT(seen_threat != noone, _id, "state_scape no threat");
		
		// --- move oppositely to threat
		
		//var _speed = _id.is_primary ? PRIMARY_SPEED : SECONDARY_SPEED;
		
		var threat_direction = point_direction(seen_threat.x, seen_threat.y, _id.x, _id.y );
		var _xTo = _id.x + lengthdir_x(_id.structure.speed_escape, threat_direction);
		var _yTo = _id.y + lengthdir_y(_id.structure.speed_escape, threat_direction);
		
		world_creature_move(_id, _xTo, _yTo); 
		
		
		// === transition
		
		_id.state.next_state = STATE.IDLE;
		
		
	}
}