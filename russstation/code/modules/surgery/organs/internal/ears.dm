/obj/item/organ/internal/ears/skaven
	name = "skaven ears"
	icon = 'russstation/icons/obj/clothing/hats.dmi'
	icon_state = "skaven"
	visual = TRUE
	dna_block = DNA_EARS_BLOCK
	bodypart_overlay = /datum/bodypart_overlay/mutant/skaven_ears
	sprite_accessory_override = /datum/sprite_accessory/ears/skaven

/datum/bodypart_overlay/mutant/skaven_ears
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT | EXTERNAL_BEHIND
	color_source = ORGAN_COLOR_INHERIT
	feature_key = "ears"

/datum/bodypart_overlay/mutant/skaven_ears/get_global_feature_list()
	return SSaccessories.ears_list

/datum/bodypart_overlay/mutant/skaven_ears/can_draw_on_bodypart(mob/living/carbon/human/human)
	if((human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return FALSE
	return TRUE

/obj/item/organ/internal/ears/kitsune
	name = "fox ears"
	icon = 'russstation/icons/obj/clothing/hats.dmi'
	icon_state = "foxie"
	visual = TRUE
	damage_multiplier = 2
	dna_block = DNA_EARS_BLOCK
	bodypart_overlay = /datum/bodypart_overlay/mutant/kitsune_ears
	sprite_accessory_override = /datum/sprite_accessory/ears/kitsune

/datum/bodypart_overlay/mutant/kitsune_ears
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT | EXTERNAL_BEHIND
	color_source = ORGAN_COLOR_HAIR
	feature_key = "ears"
	/// We dont color the inner part, which is the front layer
	var/colorless_layer = EXTERNAL_FRONT

/datum/bodypart_overlay/mutant/kitsune_ears/get_global_feature_list()
	return SSaccessories.ears_list

/datum/bodypart_overlay/mutant/kitsune_ears/can_draw_on_bodypart(mob/living/carbon/human/human)
	if((human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return FALSE
	return TRUE

/datum/bodypart_overlay/mutant/kitsune_ears/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(draw_layer != bitflag_to_layer(colorless_layer))
		return ..()
	return overlay
