
/obj/item/pen/laughter/attack(mob/living/M, mob/user, params)
	. = ..()
	if(!.)
		return
	if(!reagents.total_volume)
		return
	if(!M.reagents)
		return
	reagents.trans_to(M, reagents.total_volume, transferred_by = user, methods = INJECT)


/obj/item/pen/laughter/Initialize()
	. = ..()
	create_reagents(25, OPENCONTAINER)
	reagents.add_reagent(/datum/reagent/toxin/lexorin, 5)
	reagents.add_reagent(/datum/reagent/consumable/superlaughter/traitor_pen, 20)
