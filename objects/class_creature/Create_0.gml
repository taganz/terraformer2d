
// -- our place in the world

my_cell = 0;

// -- if created from IDE object
if object_get_parent(id) == "class_creature" {
	genus = creature_genus_from_object_name();
	creature_event_create(id);
}

// if created from reproduction code, creature_event_create will be called there


