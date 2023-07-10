// Russ livers, fow now one file is good enough, but feel free to separate it into files for each species later on.

/obj/item/organ/internal/liver/dwarf
	name = "dwarf liver"
	desc = "A liver evolved for exclusive alcohol processing, demonstrating regenerative capabilities when processing a particular drink."
	maxHealth = STANDARD_ORGAN_THRESHOLD*0.65
	toxTolerance = 2

/obj/item/organ/internal/liver/dwarf/handle_chemical(mob/living/carbon/organ_owner, datum/reagent/chem, seconds_per_tick, times_fired)
	. = ..()
	// parent returned COMSIG_MOB_STOP_REAGENT_CHECK or we are failing
	if((. & COMSIG_MOB_STOP_REAGENT_CHECK) || (organ_flags & ORGAN_FAILING))
		return
	if(istype(chem, /datum/reagent/)) // Every chem hurts the liver, but manly dorf heals it
		if(istype(chem, /datum/reagent/consumable/ethanol))
			organ_owner.adjustBruteLoss(-0.9 * REM * seconds_per_tick)
			organ_owner.adjustFireLoss(-0.9 * REM * seconds_per_tick)
			if(istype(chem, /datum/reagent/consumable/ethanol/manly_dorf))
				organ_owner.adjustOrganLoss(ORGAN_SLOT_LIVER, -1.0 * REM * seconds_per_tick) // This will get added to natural regen
				return
			return // Ethanol returns before hurting liver

		organ_owner.adjustOrganLoss(ORGAN_SLOT_LIVER, 0.5 * REM * seconds_per_tick)
		return


