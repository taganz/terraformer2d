
function genus_instance_create(_x, _y, _genus){

	// create instance of creature and assign genus 
	
	var _creature_id = instance_create_layer(_x, _y, "Instances", class_creature);
	_creature_id.genus = _genus;
	
	// initialize genome, structure, brain, morphology, state 
	
	creature_create(_creature_id);
			
	return _creature_id
}
