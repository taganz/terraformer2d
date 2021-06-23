// === randomize

if RANDOMIZE_AT_START
	randomize();



// simulation area size
world_max_x = window_get_width();
world_max_y = window_get_height();
	
// === log class

log = new Log();


// holds species statistics, initial species definitions (will be reloaded at each room)

species = new Species();


// === user options for next simulation

user_options = new User_options();
sim_paused = -1;			// simulation is paused


// load sprites
specie_load_sprites();


// check for missing objects
//genus_check_objects_exist();	


// === hide object

// depth = -15000;