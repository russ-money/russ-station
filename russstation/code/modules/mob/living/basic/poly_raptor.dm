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

	// Speech stuff
	var/speech_probability_rate = 13
	var/speech_shuffle_rate = 30
	// For it to speak it should have a custom AI, I'll just make it a raptor child with a parroting subtree and hope it works
	ai_controller = /datum/ai_controller/basic_controller/raptor/poly

/mob/living/basic/poly_raptor/Initialize(mapload)
	// This calls the parent's Iniatilize, in this case /mob/living/basic
	. = ..()

	// Add traits
	ADD_TRAIT(src, list(TRAIT_LAVA_IMMUNE, TRAIT_ASHSTORM_IMMUNE, TRAIT_SNOWSTORM_IMMUNE), INNATE_TRAIT)

	// Gives it some powers for player controlled 'actions', must be /datum/action
	var/static/list/innate_actions = list(
		/datum/action/cooldown/spell/cone/staggered/fire_breath,
		/datum/action/cooldown/mob_cooldown/charge/basic_charge/lobster,
	)
	grant_actions_by_list(innate_actions)

	// Adds extra stuff the mob can do
	AddElementTrait(TRAIT_WADDLING, INNATE_TRAIT, /datum/element/waddling)
	AddElement(/datum/element/ai_retaliate)
	AddElement(/datum/element/door_pryer, pry_time = 2.5 SECONDS, interaction_key = POLYRAPTOR_INTERACTION)
	AddElement(/datum/element/poster_tearer, interaction_key = POLYRAPTOR_INTERACTION)
	AddElement(/datum/element/footstep, footstep_type = FOOTSTEP_HARD_CLAW)
	AddComponent(/datum/component/listen_and_repeat, desired_phrases = get_static_list_of_phrases(), blackboard_key = BB_PARROT_REPEAT_STRING)

	// When it moves it fires this
	RegisterSignal(src, COMSIG_ATOM_DIR_CHANGE, PROC_REF(on_dir_change))
	adjust_offsets(dir)

	// Create radio and implant
	var/obj/item/implant/radio/poly_raptor/poly_rapdio = new(src)
	poly_rapdio.implant(src, null, TRUE, TRUE)

	// Update AI with speech timers and chances
	update_speech_blackboards()

// It's own custom radio implant
/obj/item/implant/radio/poly_raptor
	name = "Poly Raptor's radio"

// We set it's options while it initializes
/obj/item/implant/radio/poly_raptor/Initialize(mapload)
	. = ..()
	radio.set_broadcasting(TRUE)
	radio.use_command = TRUE // DINOS SHOULD BE LOUD
	radio.should_be_broadcasting = TRUE
	radio.should_be_listening = TRUE
	radio.canhear_range = 1

// This is so the sprite tries to keep centered
/mob/living/basic/poly_raptor/proc/on_dir_change(datum/source, old_dir, new_dir)
	SIGNAL_HANDLER
	adjust_offsets(new_dir)

/mob/living/basic/poly_raptor/proc/adjust_offsets(direction)
	pixel_x = (direction & EAST) ? -20 : 0
	pixel_y = (direction & NORTH) ? -5 : 0

// Let's not load the poly file twice, it'll take too much time, so it'll only say these and learned phrases.
/mob/living/basic/poly_raptor/proc/get_static_list_of_phrases()
	var/static/list/default_phrases = list(
		"BAWWWWK botany griffing me!",
		"Get Fucked Gene!",
		"Hello!",
	)
	return default_phrases

// Send these values to it's AI
/mob/living/basic/poly_raptor/proc/update_speech_blackboards()
	ai_controller.set_blackboard_key(BB_PARROT_REPEAT_PROBABILITY, speech_probability_rate)
	ai_controller.set_blackboard_key(BB_PARROT_PHRASE_CHANGE_PROBABILITY, speech_shuffle_rate)

// Return an empty list because we always say on common, might change this if we put channels into the implant
/mob/living/basic/poly_raptor/proc/get_available_channels()
	return list()

// On var edit reload these values
/mob/living/basic/poly_raptor/vv_edit_var(var_name, vval)
	. = ..()
	switch(var_name)
		if(NAMEOF(src, speech_probability_rate))
			update_speech_blackboards()
		if(NAMEOF(src, speech_shuffle_rate))
			update_speech_blackboards()
