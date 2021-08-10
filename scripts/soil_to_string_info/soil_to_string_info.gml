function soil_to_string_info(_soil) {
	if _soil == SOIL.DEFAULT {
		return "Not a valid soil";
	}
	else {
	return 
		"Soil: "+soil_to_string(_soil)
		+ "\nField capacity: "+string(soil_get_field_capacity(_soil))
		+ "\nPermanent wilting point: "+string(soil_get_permanent_wilting_point(_soil))
		+ "\nSaturation (kg): "+string(soil_saturation_water_kg(_soil))
		+ "\nLosses"
		+ "\n   TUNDRA:        "+string(soil_get_losses_rate(CLIMATE.TUNDRA, _soil))
		+ "\n   TROPICAL:      "+string(soil_get_losses_rate(CLIMATE.TROPICAL, _soil))
		+ "\n   CONTINENTAL:   "+string(soil_get_losses_rate(CLIMATE.CONTINENTAL, _soil))
		+ "\n   MEDITERRANEAN: "+string(soil_get_losses_rate(CLIMATE.MEDITERRANEAN, _soil))
		+ "\n   DRY:           "+string(soil_get_losses_rate(CLIMATE.DRY, _soil))
		+ "\n   SUPERARID:     "+string(soil_get_losses_rate(CLIMATE.SUPERARID, _soil))

	}
}
