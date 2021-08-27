function controller_event_create(){


 with controller {
	 
	 // === randomize
	if RANDOMIZE_AT_START
		randomize();

	// == Screen size

	
	// === log class

	log = new Log();


	// holds species statistics, initial species definitions (will be reloaded at each room)

	species = new Species();


	// === user options for next simulation

	user_options = new User_options();
	sim_paused = false;			// simulation is paused?
	sim_active = false;			// simulation is not yet initialized

	// load sprites
	specie_load_sprites();

	// do simple unit test here
	test_run_at_controller_create();




 }
}