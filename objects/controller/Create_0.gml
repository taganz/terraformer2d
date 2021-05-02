// === randomize

if RANDOMIZE_AT_START
	randomize();


//  === default values, can be adjusted by user from gui

default_climate_change_temperature_increment = 0;
default_world_radiation = SIMULATION_WORLD_RADIATION;


// === user options for next simulation

user_options = new User_options();

// === log class

log = new Log();


// === hide object

// depth = -15000;