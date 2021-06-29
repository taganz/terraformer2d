// spawning can not be done at create event because we need to set instance variables before doing spawn

string("Spawner "+string(id)+" begin")
var dist = spawner_distance_max / controller.game_max_y; 
spawner_genus(spawner_genus_to_spawn, spawner_quantity, dist, spawner_apply_radiation);
string("Spawner "+string(id)+" end. Destroying...")

instance_destroy();