// spawning can not be done at create event because we need to set instance variables before doing spawn

string("Spawner "+string(id)+" begin")

spawner_genus(spawner_genus_to_spawn, x, y, spawner_quantity, spawner_distance_max, spawner_apply_radiation);
string("Spawner "+string(id)+" end. Destroying...")

instance_destroy();