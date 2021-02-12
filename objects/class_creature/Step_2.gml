 /// @description Log biomass
// Puede escribir su código en este editor

if controller.time.sim_step_entry {
	LOG(LOGEVENT.CREATURE_BIOMASS, id);
}