
/* 
	
	0.BORN --> IDLE	
	1.IDLE 
		--> IDLE 
		--> EAT		if hungry, only animals, plants receive water directly from world)
		--> REPRODUCTION
		--> DEAD
	2.REPRODUCTION --> IDLE
	3.EAT
		--> IDLE
		--> DEAD
	4.DEAD
		
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