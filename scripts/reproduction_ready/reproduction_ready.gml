function reproduction_ready(_id){
			
	with _id.structure {
		return biomass_reproduction > _biomass_reproduction_max * 0.7
				and age - reproduction_age_last_time > _reproduction_interval; 
	}
}