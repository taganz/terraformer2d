function Morphology(_id) constructor {



	// default sprites
	
	sprite_head = spr_creature_default;
	sprite_dead = spr_creature_default_dead;
	
	// color adjustment
	
	specie_blend = -1;		// default blend

	// size parameters

	_head_w_scale = 0;		// scale factor, depends on density and form factor
	_head_h_scale = 0;

	_my_scale_factor_w = -1;
	_my_scale_factor_h = -1;
	
}