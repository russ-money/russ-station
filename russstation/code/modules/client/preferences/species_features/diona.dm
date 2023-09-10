// based heavily off the pod hair setup in TG code | /datum/preference/choiced/pod_hair in pod.dm
/datum/preference/choiced/diona_hair
	savefile_key = "feature_diona_hair"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Hairstyle"
	should_generate_icons = TRUE

/datum/preference/choiced/diona_hair/init_possible_values()
	return assoc_to_keys_features(GLOB.diona_hair_list)

/datum/preference/choiced/diona_hair/icon_for(value)
	var/datum/sprite_accessory/diona_hair = GLOB.diona_hair_list[value]

	var/icon/icon_with_hair = icon('icons/mob/human/bodyparts_greyscale.dmi', "pod_head_m")

	var/icon/icon_adj = icon(diona_hair.icon, "m_diona_hair_[diona_hair.icon_state]_ADJ")
	icon_with_hair.Blend(icon_adj, ICON_OVERLAY)
	icon_with_hair.Scale(64, 64)
	icon_with_hair.Crop(15, 64, 15 + 31, 64 - 31)

	return icon_with_hair

/datum/preference/choiced/diona_hair/create_default_value()
	return pick(GLOB.diona_hair_list)

/datum/preference/choiced/diona_hair/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["diona_hair"] = value
