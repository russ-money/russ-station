/mob/living/basic/pet/cat/hyena
	name = "Hyena"
	icon = 'russstation/icons/mob/hyena.dmi'
	icon_state = "hyena"
	icon_living = "hyena"
	icon_dead = "hyena_dead"
	held_state = "fox"
	speak_emote = list("barks", "laughs")
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'sound/items/weapons/bite.ogg'
	butcher_results = list(/obj/item/food/meat/slab/synthmeat = 3)
	attack_vis_effect = ATTACK_EFFECT_BITE
	cult_icon_state = "hyena_cult"

/datum/emote/cat/hyena
	mob_type_allowed_typecache = /mob/living/basic/pet/cat/hyena
	mob_type_blacklist_typecache = list()

/datum/emote/cat/hyena/laugh
	key = "laughs"
	key_third_person = "laughs"
	message = "laughs!"
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE

/datum/emote/cat/hyena/bark
	key = "barks"
	key_third_person = "barks"
	message = "barks."
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE

/mob/living/basic/pet/cat/hyena/breadyeen
	name = "bread hyena"
	desc = "A whole-wheat yeen!"
	icon_state = "breadyeen"
	icon_living = "breadyeen"
	icon_dead = "breadyeen_dead"
	ai_controller = /datum/ai_controller/basic_controller/cat/bread
	can_interact_with_stove = TRUE
	butcher_results = list(
		/obj/item/food/meat/slab = 2,
		/obj/item/food/breadslice/plain = 1
	)
	collar_icon_state = null

/mob/living/basic/pet/cat/hyena/breadyeen/add_cell_sample()
	return

/mob/living/basic/pet/cat/hyena/might
	name = "Mighty"
	desc = "The product of alien DNA and bored geneticists."
	gender = FEMALE
	icon_state = "might"
	icon_living = "might"
	icon_dead = "might_dead"

/mob/living/basic/pet/cat/hyena/might/add_cell_sample()
	return

/mob/living/basic/pet/cat/hyena/cub
	name = "cub"
	desc = "D'aaawwww."
	icon_state = "cub"
	icon_living = "cub"
	icon_dead = "cub_dead"
	density = FALSE
	pass_flags = PASSMOB
	mob_size = MOB_SIZE_SMALL
	can_breed = FALSE
	ai_controller = /datum/ai_controller/basic_controller/cat/kitten
	can_hold_item = FALSE
	collar_icon_state = "kitten"

/mob/living/basic/pet/cat/hyena/second
	icon_state = "hyena2"
	icon_living = "hyena2"
	icon_dead = "hyena2_dead"

/mob/living/basic/pet/cat/hyena/hyake
	name = "Keeki"
	desc = "He is a hyena made out of cake."
	icon_state = "hyake"
	icon_living = "hyake"
	icon_dead = "hyake_dead"
	health = 50
	maxHealth = 50
	gender = MALE
	butcher_results = list(
		/obj/item/organ/brain = 1,
		/obj/item/organ/heart = 1,
		/obj/item/food/cakeslice/birthday = 3,
		/obj/item/food/meat/slab = 1,
		/obj/item/food/meat/slab/corgi = 1,
	)
	response_harm_continuous = "takes a bite out of"
	response_harm_simple = "take a bite out of"
	ai_controller = /datum/ai_controller/basic_controller/cat/cake
	attacked_sound = 'sound/items/eatfood.ogg'
	death_message = "loses his false life and collapses!"
	death_sound = SFX_BODYFALL
	held_state = "cak"
	can_interact_with_stove = TRUE

/mob/living/basic/pet/cat/hyena/hyake/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/regenerator,\
		regeneration_delay = 1 SECONDS,\
		brute_per_second = 5,\
		outline_colour = COLOR_PINK,\
	)
	var/static/list/on_consume = list(
		/datum/reagent/consumable/nutriment = 0.4,
		/datum/reagent/consumable/nutriment/vitamin = 0.4,
	)
	AddElement(/datum/element/consumable_mob, reagents_list = on_consume)

/mob/living/basic/pet/cat/hyena/hyake/add_cell_sample()
	return

/mob/living/basic/pet/cat/hyena/hyake/CheckParts(list/parts)
	. = ..()
	var/obj/item/organ/brain/candidate = locate(/obj/item/organ/brain) in contents
	if(isnull(candidate?.brainmob?.mind))
		return
	var/datum/mind/candidate_mind = candidate.brainmob.mind
	candidate_mind.transfer_to(src)
	candidate_mind.grab_ghost()
	to_chat(src, "[span_boldbig("You are a hyake!")]<b> You're a harmless hyena/cake hybrid that everyone loves. People can take bites out of you if they're hungry, but you regenerate health \
	so quickly that it generally doesn't matter. You're remarkably resilient to any damage besides this and it's hard for you to really die at all. You should go around and bring happiness and \
	free cake to the station!</b>")
	var/default_name = initial(name)
	var/new_name = sanitize_name(reject_bad_text(tgui_input_text(src, "You are the [name]. Would you like to change your name to something else?", "Name change", default_name, MAX_NAME_LEN)), cap_after_symbols = FALSE)
	if(new_name)
		to_chat(src, span_notice("Your name is now <b>[new_name]</b>!"))
		name = new_name

/mob/living/basic/pet/cat/hyena/hyake/spin(spintime, speed)
	. = ..()
	for(var/obj/item/food/donut/target in oview(1, src))
		if(!target.is_decorated)
			target.decorate_donut()

/datum/crafting_recipe/food/hyake
	name = "Living hyena/cake hybrid"
	reqs = list(
		/obj/item/organ/brain = 1,
		/obj/item/organ/heart = 1,
		/obj/item/food/cake/birthday = 1,
		/obj/item/food/meat/slab = 2,
		/obj/item/food/meat/slab/corgi = 1,
		/datum/reagent/blood = 30,
		/datum/reagent/consumable/sprinkles = 5,
		/datum/reagent/teslium = 1 //To shock the whole thing into life
	)
	result = /mob/living/basic/pet/cat/hyena/hyake
	category = CAT_CAKE
