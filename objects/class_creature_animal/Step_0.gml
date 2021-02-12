event_inherited();


// depth for drawing		
switch(dna.genome[GEN.TROPHIC_LEVEL]) {
	case TROPHIC_LEVEL.PRIMARY:		depth = -LAYER_BASE_PRIMARY - y; break;
	case TROPHIC_LEVEL.SECONDARY:	depth = -LAYER_BASE_SECONDARY -y; break;
}

