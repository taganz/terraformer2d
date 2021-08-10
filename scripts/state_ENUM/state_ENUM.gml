
/* 
	state_ENUM()
	
	//0.BORN 
	//	--> IDLE	
	1.IDLE 
		decide next action
		--> IDLE 
		--> EAT				if hungry (animals)
		--> REPRODUCTION	if ready for reproduction
		--> DEAD
	2.REPRODUCTION 
		precondition: ready for reproduction
		--> IDLE
	3.EAT
		search for food and eat when found. only for animals, plants receive water from world
		precondition:	is hungry, not is_plant
		--> IDLE	if not hungry
		--> EAT		if is_hungry 
	4.ESCAPE - *state_step can set this state*
		run to escape from threat
		precondition: threat exists
		--> IDLE	
	5.DEAD  - *state_step can set this state*
		precondition: is_dead 
		
	
*/

function state_ENUM(){
	
	enum STATE {
		//BORN,
		IDLE,
		REPRODUCTION,
		EAT,
		ESCAPE,
		DEAD
	}
	
}