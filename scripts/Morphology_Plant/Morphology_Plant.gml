function Morphology_Plant(_id) constructor {

	sprite_head = _id.creature_sprite_head;
	sprite_body = _id.creature_sprite_body;
	sprite_dead = _id.creature_sprite_dead; 

	// those are assigned at morphology_born depending on genome
	sprite_head_image = -1;
	sprite_body_image = -1;
	sprite_dead_image = -1;
		
	// color adjustment
	specie_blend = -1;		// default blend

	
#region private attributes

	//my_id = _id;
	
	// -- size parameters
	
	_head_w_scale = 0;		// scale factor, depends on density and form factor
	_head_h_scale = 0;
	_body_w_scale = 0;
	_body_h_scale = 0;
	_head_w = 1;			// scaled sprite size  
	_head_h = 1;
	_body_w = 1;
	_body_h = 1;

#endregion


}