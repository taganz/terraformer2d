
function log_text_creature(_id){

	return string(_id) 
	+ "\n"+gen_to_string(_id.dna.genome[GEN.SPECIE_CODE])
	+ "\ninitial_specie: "+string(_id.dna.genome[GEN.INITIAL_SPECIE])
	+ "\n"+string_format(units_to_kg(_id.structure.biomass), 4, 1)+"kg"
	+ "\n"+string(sim_steps_to_years(_id.structure.age))+"y"
	+ "\nSTATE: " + _id.state.to_string()
	+ "\nCELL:"+controller.world.cell_to_string(_id.x, _id.y)
	;

	
}