// log population at current step
function log_step_population(){

	with controller {

		log_event(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.PRODUCER, world.trophic_level_live_now[TROPHIC_LEVEL.PRODUCER]);
		log_event(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.PRIMARY, world.trophic_level_live_now[TROPHIC_LEVEL.PRIMARY]);
		log_event(LOGEVENT.WORLD_POPULATION, 0, TROPHIC_LEVEL.SECONDARY, world.trophic_level_live_now[TROPHIC_LEVEL.SECONDARY]);
		log_event(LOGEVENT.WORLD_BIOMASS, 0, TROPHIC_LEVEL.PRODUCER, world.trophic_level_biomass_now[TROPHIC_LEVEL.PRODUCER]);
		log_event(LOGEVENT.WORLD_BIOMASS, 0, TROPHIC_LEVEL.PRIMARY, world.trophic_level_biomass_now[TROPHIC_LEVEL.PRIMARY]);
		log_event(LOGEVENT.WORLD_BIOMASS, 0, TROPHIC_LEVEL.SECONDARY, world.trophic_level_biomass_now[TROPHIC_LEVEL.SECONDARY]);

		for (var _genus = 1; _genus <GENUS._LENGTH_; _genus++) {
			// log only initialized genus
			if controller.species.genus_population[@ _genus] != -1
				log_event(LOGEVENT.GENUS_POPULATION, 0, _genus);
		}

	}

}