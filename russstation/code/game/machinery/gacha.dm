/obj/machinery/gacha
	name = "Gacha machine"
	desc = "The capsules seem oddly translucent... Perhaps it's best to find a different machine."
	icon = 'russstation/icons/obj/machines/gacha_machine.dmi'
	icon_state = "gacha_machine"
	base_icon_state = "gacha_machine"
	layer = BELOW_OBJ_LAYER // So dispensed balls don't end up underneath the machine
	density = TRUE // So players can't pass through

	// Health/armor stuff
	max_integrity = 300
	integrity_failure = 0.33
	armor_type = /datum/armor/machinery_vending

	// Misc. stuff yoinked from vendor machine code
	circuit = /obj/item/circuitboard/machine/vendor
	light_power = 0.7
	light_range = MINIMUM_USEFUL_LIGHT_RANGE

	var/list/prize_pool = list()

/obj/machinery/gacha/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if (istype(tool, /obj/item/coin))
		qdel(tool)
		dispense_gacha_capsule(user)
		balloon_alert(user, "ka-chunk!")
		return ITEM_INTERACT_SUCCESS

	return NONE

/obj/machinery/gacha/proc/dispense_gacha_capsule(mob/living/user)
	var/obj/item/gacha_capsule/gacha_capsule = new /obj/item/gacha_capsule(get_turf(src))
	gacha_capsule.prize = pick_weight(fill_with_ones(src.prize_pool))
	playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
	visible_message(span_notice("[src] dispenses [gacha_capsule]!"), span_notice("You hear a chime and a clunk."))

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

// Plushies!
/obj/machinery/gacha/plush
	name = "Plushie gacha machine"
	desc = "The next capsule will contain that plushie you've always wanted, guaranteed!"

	prize_pool = list(
		/obj/item/toy/plush/carpplushie,
		/obj/item/toy/plush/bubbleplush,
		/obj/item/toy/plush/ratplush,
		/obj/item/toy/plush/narplush,
		/obj/item/toy/plush/lizard_plushie,
		/obj/item/toy/plush/snakeplushie,
		/obj/item/toy/plush/nukeplushie,
		/obj/item/toy/plush/plasmamanplushie,
		/obj/item/toy/plush/slimeplushie,
		/obj/item/toy/plush/awakenedplushie,
		/obj/item/toy/plush/whiny_plushie,
		/obj/item/toy/plush/beeplushie,
		/obj/item/toy/plush/goatplushie,
		/obj/item/toy/plush/moth,
		/obj/item/toy/plush/pkplush,
		/obj/item/toy/plush/rouny,
		/obj/item/toy/plush/abductor,
		/obj/item/toy/plush/abductor/agent,
		/obj/item/toy/plush/shark,
		/obj/item/toy/plush/donkpocket,
		/obj/item/toy/plush/ducky
	)
