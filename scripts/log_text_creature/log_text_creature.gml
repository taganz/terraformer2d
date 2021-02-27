
function log_text_creature(_id){

	return string(_id) 
	+ "\n"+_id.dna.genome[GEN.SPECIE_CODE]
	//+ "\nis_adult_growth: " + string(_id.structure.age_is_adult_growth)
	//+ "\nreproduction_age_last_time: " + string(sim_steps_to_years(_id.structure.reproduction_age_last_time))+"y"
	//+ "\nis_adult_reproduction: " + string(_id.structure.age_is_adult_reproduction)
	//+ "\nreproduction_count: " + string(_id.structure.reproduction_count)
	+ "\nSTATE: " + _id.state.to_string()
	//+ "\nGENOME: " + _id.dna.genome_to_string()
	//+ "\nSTRUCTURE: "+_id.structure.to_string_parameters()
	+ "\nCELL:"+controller.world.cell_to_string(_id.x, _id.y)
	;

	
}