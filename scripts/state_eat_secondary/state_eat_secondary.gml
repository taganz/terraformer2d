


function state_eat_secondary(_id){



	ASSERT(_id.dna.genome[@ GEN.TROPHIC_LEVEL]==TROPHIC_LEVEL.SECONDARY, _id, "state_eat_secondary error trophic level");
		
			
		
	_id.state.next_state = STATE.IDLE;
	
}
