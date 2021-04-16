
/* 
	
	BORN --> IDLE	
	IDLE 
		--> IDLE 
		--> EAT		if hungry, only animals, plants receive water directly from world)
		--> REPRODUCTION
		--> DEAD
	REPRODUCTION --> IDLE
	EAT
		--> IDLE
		--> DEAD
		
*/

function state_ENUM(){
	
	enum STATE {
		BORN,
		IDLE,
		REPRODUCTION,
		EAT,
		DEAD
	}
	
}