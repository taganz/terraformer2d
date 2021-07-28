function can_eat(_predator_id, _prey_id){

	return _predator_id.genome[GEN.COMBAT_ATTACK_POINTS] > _prey_id.genome[GEN.COMBAT_DEFENSE_POINTS]
		and (_prey_id.structure.biomass > _prey_id.structure.biomass_adult_genome * _predator_id.structure.min_biomass_fraction_to_eat 
			or _prey_id.structure.biomass > _predator_id.structure.biomass)

}