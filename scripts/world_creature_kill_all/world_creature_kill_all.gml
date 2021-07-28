
function world_creature_kill_all(){
	with class_creature {
		
		// plants could be still not born?
		if structure.age == 0 and structure.is_dead == false {
			structure.is_dead = true;
			structure.dead_cause = DEADCAUSE.BIRTH;
		}
			
		if structure.is_dead == false {
			structure.is_dead = true;
			structure.dead_case = DEADCAUSE.USER;
		}
	}
}