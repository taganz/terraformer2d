function specie_load_sprites(){

	with controller.species {
		
		for (var i=0;i<GENUS._LENGTH_;i++) {
			var sprite_head_string = genus_get_gen(i, GEN.SPRITE_HEAD);
			if ( string(sprite_head_string) != "-1") {
				var sprite_id = sprite_add(SPRITES_FOLDER +"\\"+string(sprite_head_string), 1, true, true, 0, 0);
				ASSERT(sprite_id != -1 or i==0, 0, "specie_load_sprites - file not found "+string(sprite_head_string)+" for genus "+string(i));
				_genus_sprite_id[@ i] = sprite_id;
				show_debug_message("sprite "+string(sprite_head_string)+" for genus "+string(i)+" = "+ string(sprite_id));
			}
		}
	}
}