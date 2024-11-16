// Upstream doesn't allow us to define the following icons/states for cultist pets.
// Any custom implementations should inherit from this and make modifications to the variables.
// This isn't entirely in line with the way cultist pet parameters are usually passed (through named args in AddElement),
// but doing so would make the AddElement() call very long and difficult to read.
/datum/element/cultist_pet/russstation
	var/pet_cult_icon_lh = 'icons/mob/inhands/animal_item_lefthand.dmi'
	var/pet_cult_icon_rh = 'icons/mob/inhands/animal_item_righthand.dmi'
	var/pet_cult_icon_head = 'icons/mob/clothing/head/pets_head.dmi'
	var/pet_cult_icon_dead
	var/pet_cult_held_state

/datum/element/cultist_pet/russstation/on_icon_state_updated(mob/living/basic/source)
	. = ..()

	if (!(FACTION_CULT in source.faction))
		return

	// Upstream defines pet_cult_icon but doesn't actually ever update the source state to match.
	// This should probably be fixed in the original datum's on_icon_state_updated.
	if (pet_cult_icon)
		source.icon = pet_cult_icon

	if (pet_cult_icon_lh)
		source.held_lh = pet_cult_icon_lh

	if (pet_cult_icon_rh)
		source.held_rh = pet_cult_icon_rh

	if (pet_cult_icon_head)
		source.head_icon = pet_cult_icon_head

	if (pet_cult_icon_dead)
		source.icon_dead = pet_cult_icon_dead

	if (pet_cult_held_state)
		source.held_state = pet_cult_held_state
