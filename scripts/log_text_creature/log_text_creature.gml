
function log_text_creature(_id){

	return string(_id) 
	+ "\nis_adult_growth: " + string(_id.structure.is_adult_growth)
	+ "\nage_last_reproduction: " + string(sim_steps_to_years(_id.structure.age_last_reproduction))+"y"
	+ "\nis_adult_reproduction: " + string(_id.structure.is_adult_reproduction)
	+ "\nreproduction_count: " + string(_id.structure.reproduction_count)
	+ "\nSTATE: " + _id.state.to_string()
	//+ "\nGENOME: " + _id.dna.genome_to_string()
	+ "\nSTRUCTURE: "+_id.structure.to_string_parameters()
	+ "\nCELL:"+controller.world.cell_to_string(_id.x, _id.y)
	;

	
}