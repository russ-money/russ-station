// Russ livers, fow now one file is good enough, but feel free to separate it into files for each species later on.

/obj/item/organ/internal/liver/dwarf
	name = "dwarf liver"
	desc = "A liver evolved for alcohol processing."
	maxHealth = STANDARD_ORGAN_THRESHOLD
	toxTolerance = 2

/obj/item/organ/internal/liver/dwarf/handle_chemical(mob/living/carbon/organ_owner, datum/reagent/chem, seconds_per_tick, times_fired)
	. = ..()
	// parent returned COMSIG_MOB_STOP_REAGENT_CHECK or we are failing
	if((. & COMSIG_MOB_STOP_REAGENT_CHECK) || (organ_flags & ORGAN_FAILING))
		return

	if(istype(chem, /datum/reagent/consumable/ethanol))
		organ_owner.adjustBruteLoss(-0.9 * REM * seconds_per_tick)
		organ_owner.adjustFireLoss(-0.9 * REM * seconds_per_tick)
		return
