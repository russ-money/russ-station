/obj/item/gacha_capsule
	name = "gacha capsule"
	desc = "What could be inside?"
	icon_state = "gacha_capsule_green"
	w_class = WEIGHT_CLASS_TINY
	icon = 'russstation/icons/obj/gacha_capsules.dmi'
	var/prize = null

/obj/item/gacha_capsule/Initialize(mapload)
	. = ..()
	var/capsule_color = pick("pink", "green", "blue", "red", "orange", "purple", "yellow")
	icon_state = "gacha_capsule_[capsule_color]"

/obj/item/gacha_capsule/attack_self(mob/user)
	..()

	if (src.prize)
		var/prize = new src.prize(get_turf(src))
		to_chat(user, span_notice("You open [src] and find [prize] inside!"))
	else
		to_chat(user, span_notice("You open [src] and... it's empty! What a scam."))

	qdel(src)
