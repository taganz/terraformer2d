/// @description log biomass
event_inherited();

if controller.time.sim_step_entry {
	LOG(LOGEVENT.CREATURE_BIOMASS_DIGESTIVE, id, structure.biomass_leaf);
}


		
