// === randomize

if RANDOMIZE_AT_START
	randomize();



// simulation area size
world_max_x = window_get_width();
world_max_y = window_get_height();
	

// holds species statistics, initial species definitions
species = new Species();


// === user options for next simulation

user_options = new User_options();
sim_paused = -1;			// simulation is paused

// === log class

log = new Log();


// check for missing objects
genus_check_objects_exist();	


// === hide object

// depth = -15000;