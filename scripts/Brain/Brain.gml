function Brain(_id) constructor {

	seen_threat = noone;			// closest predator seen (can not use -1 because -1 == self)
	seen_food = noone;				// closest food seen
	seen_food_distance = -1;

	//last_prey_eaten = -1;		// used by ?
	
	home_x = _id.x;			// reference point
	home_y = _id.y;
	
}

