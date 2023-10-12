//Default Clowns

/mob/living/basic/clown


/mob/living/basic/clown/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/seethrough_mob)


//Clown Hulk
/mob/living/basic/clown/clownhulk
	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/basic/clown/clownhulk/proc/target_bodyparts(atom/the_target)
	var/list/parts = list()
	if(iscarbon(the_target))
		var/mob/living/carbon/C = the_target
		if(C.stat >= UNCONSCIOUS)
			for(var/X in C.bodyparts)
				var/obj/item/bodypart/BP = X
				if(BP.body_part != HEAD && BP.body_part != CHEST)
					if(!(BP.bodypart_flags & BODYPART_UNREMOVABLE))
						parts += BP
			return parts

/mob/living/basic/clown/clownhulk/melee_attack(mob/living/target, list/modifiers, ignore_cooldown)
	var/list/parts = target_bodyparts(target)
	if(parts)
		if(!parts.len)
			return FALSE
		var/obj/item/bodypart/BP = pick(parts)
		BP.dismember()
		return ..()
	. = ..()
	if (!. || !isliving(target))
		return
	if (prob(20))
		target.Paralyze(2 SECONDS)
		visible_message(span_danger("[src] knocks [target] down!"))
	else
		target.throw_at(get_edge_target_turf(target, dir), range = rand(1, 2), speed = 7, thrower = src)

//Chlown
/mob/living/basic/clown/clownhulk/chlown


//Honcmunculus
/mob/living/basic/clown/clownhulk/honcmunculus
	melee_damage_lower = 10
	melee_damage_upper = 15
	environment_smash = ENVIRONMENT_SMASH_WALLS


//The Destroyer
/mob/living/basic/clown/clownhulk/destroyer


//Russ Station Clowns

/mob/living/basic/clown/russ
	icon = 'russstation/icons/mob/clown_mobs.dmi'

//Goblin
/mob/living/basic/clown/russ/goblin
	name = "clown goblin"
	desc = "A tiny walking mask and clown shoes. You want to honk his nose!"
	icon_state = "clowngoblin"
	icon_living = "clowngoblin"
	icon_dead = null
	response_help_simple = "honks the"
	response_help_continuous = "honks the"
	emotes = list(
		BB_EMOTE_SAY = list("HONK", "Honk!"),
		BB_EMOTE_SEE = list("honka"),
		BB_EMOTE_CHANCE = 5,
	)
	maxHealth = 100
	health = 100

	speed = 1

	basic_mob_flags = DEL_ON_DEATH
	loot = list(/obj/item/clothing/mask/gas/clown_hat, /obj/item/clothing/shoes/clown_shoes)

//Lesser Goblin
/mob/living/basic/clown/russ/goblin/lessergoblin
	name = "clown goblin"
	desc = "A tiny walking mask and clown shoes, kinda looks malnourished. You want to honk his nose!"
	icon_state = "clowngoblin"
	icon_living = "clowngoblin"
	icon_dead = null
	response_help_simple = "honks the"
	response_help_continuous = "honks the"
	emotes = list(
		BB_EMOTE_SAY = list("HONK", "Honk!"),
		BB_EMOTE_SEE = list("squeaks"),
		BB_EMOTE_CHANCE = 5,
	)
	maxHealth = 15
	health = 15
	melee_damage_lower = 5
	melee_damage_upper = 5

	speed = 1

	basic_mob_flags = DEL_ON_DEATH
	loot = list(/obj/item/food/grown/russ/citrus/white)
