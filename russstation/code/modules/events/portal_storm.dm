/datum/round_event_control/portal_storm_honk
	name = "Portal Storm: Honk"
	typepath = /datum/round_event/portal_storm/portal_storm_honk
	weight = 5 // Same as aliums
	min_players = 10 // this can be a fairly dangerous event, but they also aren't hostile by default
	earliest_start = 30 MINUTES
	category = EVENT_CATEGORY_ENTITIES
	description = "Clowns pour out of portals."

/datum/round_event/portal_storm/portal_storm_honk
	boss_types = list(
		/mob/living/basic/clown/russ/goblin/lessergoblin = 1, \
		/mob/living/basic/clown/lube = 1, \
		/mob/living/basic/clown/banana = 1,
	)
	hostile_types = list(
		/mob/living/basic/clown/russ/goblin/lessergoblin = 6,
	)

/datum/round_event_control/rat_ogre_invasion
	name = "Portal Storm: Rat Ogres"
	typepath = /datum/round_event/portal_storm/rat_ogre_invasion
	weight = 3
	min_players = 20
	earliest_start = 20 MINUTES
	category = EVENT_CATEGORY_ENTITIES
	description = "Rat Ogres!"

/datum/round_event/portal_storm/rat_ogre_invasion
	hostile_types = list(
		/mob/living/simple_animal/hostile/rat_ogre = 2
	)
