/// @description Add creature
// Puede escribir su código en este editor

if room!=Room0  {
	id_new = instance_create_layer(mouse_x, mouse_y, "Instances", OBJ_CREATED_BY_CLIC);
	show_debug_message("Created instance: "+string(id_new)+" and started following it");
	gui.follow(id_new);
}