#define POLYRAPTOR_INTERACTION "poly_raptor"

/mob/living/basic/poly_raptor
	name = "Poly Raptor"
	desc = "Poly the...RAPTOR! An expert on quantum bone-cracker theory. It seems he ate his headset. Fiercely loyal to the Chief-Engineer"
	icon = 'russstation/icons/mob/poly_raptor.dmi'
	speed = 0.5
	icon_state = "poly_raptor"
	icon_living = "poly_raptor"
	icon_dead = "poly_raptor_ded"
	health = 400
	maxHealth = 400
	pass_flags = PASSTABLE
	damage_coeff = list(BRUTE = 1.5, BURN = 0.5, TOX = 0, STAMINA = 0, OXY = 1)
	///speech_probability_rate = 13

	guaranteed_butcher_results = list(/obj/item/food/cracker = 3)
	melee_damage_upper = 25
	melee_damage_lower = 20
	melee_attack_cooldown = 10
	obj_damage = 40

	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently moves aside"
	response_disarm_simple = "gently move aside"
	response_harm_continuous = "swats"
	response_harm_simple = "swat"
	combat_mode = TRUE
	attack_verb_continuous = "chomps"
	attack_verb_simple = "chomp"
	attack_vis_effect = ATTACK_EFFECT_BITE
	attack_sound = 'sound/items/weapons/bite.ogg'
	friendly_verb_continuous = "grooms"
	friendly_verb_simple = "groom"
	mob_size = MOB_SIZE_LARGE
	gold_core_spawnable = NO_SPAWN
	ai_controller = /datum/ai_controller/basic_controller/raptor
	var/change_offsets = TRUE

	///Door Prying Test Stuff VVV

/mob/living/basic/poly_raptor/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, list(TRAIT_LAVA_IMMUNE, TRAIT_ASHSTORM_IMMUNE, TRAIT_SNOWSTORM_IMMUNE), INNATE_TRAIT)

	///RegisterSignal(src, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, PROC_REF(pre_attack))
	///RegisterSignal(src, COMSIG_MOB_LOGIN, PROC_REF(on_login))

	///Innate Abilities , Poly Raptor vvv

	var/static/list/innate_actions = list(
		/datum/action/cooldown/spell/cone/staggered/fire_breath,
		/datum/action/cooldown/mob_cooldown/charge/basic_charge/lobster,
		/obj/item/implant/radio/antenna,
	)

	grant_actions_by_list(innate_actions)


	///Innate Abilities , Poly Raptor ^^^

	///Door PRying Test Stuff VVV

	AddElementTrait(TRAIT_WADDLING, INNATE_TRAIT, /datum/element/waddling)
	AddElement(/datum/element/ai_retaliate)
	AddElement(/datum/element/door_pryer, pry_time = 2.5 SECONDS, interaction_key = POLYRAPTOR_INTERACTION)
	AddElement(/datum/element/poster_tearer, interaction_key = POLYRAPTOR_INTERACTION)
	AddElement(/datum/element/footstep, footstep_type = FOOTSTEP_HARD_CLAW)
	RegisterSignal(src, COMSIG_ATOM_DIR_CHANGE, PROC_REF(on_dir_change))
	adjust_offsets(dir)

	///Door PRying Test Stuff ^^^

/mob/living/basic/poly_raptor/proc/on_dir_change(datum/source, old_dir, new_dir)
	SIGNAL_HANDLER
	adjust_offsets(new_dir)

/mob/living/basic/poly_raptor/proc/adjust_offsets(direction)
	if(!change_offsets)
		return
	pixel_x = (direction & EAST) ? -20 : 0
	pixel_y = (direction & NORTH) ? -5 : 0

	///NOT WORKING POLY TALK VVV

/mob/living/basic/parrot/poly/get_static_list_of_phrases() // there's only one poly, so there should only be one ongoing list of phrases. i guess
	var/static/list/phrases_to_return = list()
	if(length(phrases_to_return))
		return phrases_to_return

	phrases_to_return += read_memory() // must come first!!!
	// now add some valuable lines every poly should have
	phrases_to_return += list(
		":e Check the crystal, you chucklefucks!",
		":e OH GOD ITS ABOUT TO DELAMINATE CALL THE SHUTTLE",
		":e WHO TOOK THE DAMN MODSUITS?",
		":e Wire the solars, you lazy bums!",
		"Poly wanna crack your skull!",
		"Poly wanna cracker!",
		"Get Fucked Gene!",
	)

	///NOT WORKING POLY TALK ^^^
