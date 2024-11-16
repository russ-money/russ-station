// It's the fearsome blood mothroach!
/datum/element/cultist_pet/russstation/mothroach
	pet_cult_icon_lh = 'russstation/icons/mob/inhands/mothroach_lefthand.dmi'
	pet_cult_icon_rh = 'russstation/icons/mob/inhands/mothroach_righthand.dmi'
	pet_cult_icon_head = 'russstation/icons/mob/clothing/head/mothroach_head.dmi'
	pet_cult_icon_dead = "mothroach_dead_cult"
	pet_cult_held_state = "mothroach_cult"

/datum/element/cultist_pet/russstation/mothroach/become_cultist(mob/living/basic/source, list/invokers, datum/team)
	. = ..()

	// If we're not a cultist at this point the parent proc probably failed or returned early, so we do the same.
	if (!(FACTION_CULT in source.faction))
		return

	source.name = "Blood mothroach"
	source.desc = "Blood for the moff god!"

/mob/living/basic/mothroach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/cultist_pet/russstation/mothroach, pet_cult_icon = 'russstation/icons/mob/mothroach.dmi', pet_cult_icon_state = "mothroach_cult")

// Our custom mothroach variants
/mob/living/basic/mothroach/kat
	icon = 'russstation/icons/mob/mothroach.dmi'
	held_lh = 'russstation/icons/mob/inhands/mothroach_lefthand.dmi'
	held_rh = 'russstation/icons/mob/inhands/mothroach_righthand.dmi'
	head_icon = 'russstation/icons/mob/clothing/head/mothroach_head.dmi'

/mob/living/basic/mothroach/kat/lunar
	name = "Lunar mothroach"
	desc = "Likes dancing under the moonlight."
	icon_state = "mothroach_lunar"
	icon_living = "mothroach_lunar"
	icon_dead = "mothroach_dead_lunar"
	held_state = "mothroach_lunar"

/mob/living/basic/mothroach/kat/death
	name = "Death mothroach"
	desc = "Its favorite music genre? Death metal."
	icon_state = "mothroach_death"
	icon_living = "mothroach_death"
	icon_dead = "mothroach_dead_death"
	held_state = "mothroach_death"

/mob/living/basic/mothroach/kat/snow
	name = "Snow mothroach"
	desc = "Also known as the ermine roach."
	icon_state = "mothroach_snow"
	icon_living = "mothroach_snow"
	icon_dead = "mothroach_dead_snow"
	held_state = "mothroach_snow"

/mob/living/basic/mothroach/kat/warden
	name = "Warden mothroach"
	desc = "The radio makes it tactical!"
	icon_state = "mothroach_warden"
	icon_living = "mothroach_warden"
	icon_dead = "mothroach_dead_warden"
	held_state = "mothroach_warden"
