/obj/structure/chair/mouse_drop_dragged(atom/over_object, mob/user, src_location, over_location, params)
	if(over_object == usr && Adjacent(usr) && ((usr.type == /mob/living/simple_animal/hostile/rat_ogre)))
		//is the ogres hands empty?
		for(var/obj/item/held_item as anything in usr.held_items)
			if(isnull(held_item) || held_item.item_flags & HAND_ITEM)
				continue
			to_chat(usr, span_notice("Both your hands need to be empty to perform this action."))
			return

		usr.carry_vending_machine(src,usr)

/mob/proc/carry_vending_machine(obj/machinery/vending/V, mob/living/user)
	for(var/datum/action/action as anything in user.actions)
		if(istype(action, /datum/action/cooldown/spell/pointed/projectile/throw_vending_machine))
			to_chat(user, span_warning("You are already carrying one. Throw it!"))
			return

	user.visible_message(span_warning("[user] starts picking up [V.name]."), span_warning("You start picking up [V.name]."))
	playsound(src, 'sound/machines/airlock_alien_prying.ogg', 100, TRUE)
	if(!do_after(user, 4 SECONDS, target = src))
		return TRUE
	user.visible_message(span_warning("[user] finishes picking up [V.name]."), span_warning("You finish picking up [V.name]."))

	var/datum/action/cooldown/spell/pointed/projectile/throw_vending_machine/vendor = new(src)

	vendor.vending_machine = V
	vendor.Grant(usr)
	qdel(V)

/datum/action/cooldown/spell/pointed/projectile/throw_vending_machine
	name = "Throwing Vending Machine"
	desc = "Throw the vending machine."
	background_icon = 'russstation/icons/mob/actions/backgrounds.dmi'
	background_icon_state = "bg_skaven"
	spell_requirements = NONE

	projectile_amount = 0
	cast_range = 10

	var/obj/machinery/vending/vending_machine = /obj/machinery/vending
	var/mutable_appearance/vendor_overlay
	var/has_machine = TRUE

/datum/action/cooldown/spell/pointed/projectile/throw_vending_machine/Grant(mob/grant_to)
	. = ..()

	src.set_click_ability(grant_to)

	vendor_overlay = mutable_appearance(vending_machine.icon, vending_machine.icon_state)

	button_icon = vending_machine.icon
	button_icon_state = vending_machine.icon_state

	vendor_overlay.pixel_y = 16
	vendor_overlay.pixel_x = 16

	grant_to.add_overlay(vendor_overlay)
	grant_to.update_appearance()

/datum/action/cooldown/spell/pointed/projectile/throw_vending_machine/cast(atom/cast_on)
	SHOULD_CALL_PARENT(FALSE)

	var/atom/caster = get_caster_from_target(owner)
	if(!isturf(caster.loc))
		return FALSE

	var/obj/A = /obj/machinery/vending
	var/atom/movable/throw_atom = null
	var/turf/caster_turf = caster.loc

	if(has_machine == TRUE)
		caster.visible_message(span_warning("[caster.name] throws the [vending_machine.name]!"), span_warning("You throw the [vending_machine.name]."))
		A = new vending_machine.type (get_turf(caster_turf))
		caster.cut_overlay(vendor_overlay)
		caster.update_appearance()

		throw_atom = A
		if(throw_atom)
			throw_atom.throw_at(cast_on, cast_range, 2, caster)

		has_machine = FALSE

	src.Remove(caster)

/datum/action/cooldown/spell/pointed/projectile/throw_vending_machine/on_deactivation(mob/on_who, refund_cooldown = TRUE)
	. = ..()
	var/mob/living/thrower = on_who
	if(has_machine == TRUE)
		thrower.visible_message(span_warning("[thrower.name] puts the [vending_machine.name] down."), span_warning("You put the [vending_machine.name] down."))
		new vending_machine.type (get_turf(thrower.loc))
		thrower.cut_overlay(vendor_overlay)
		thrower.update_appearance()
		has_machine = FALSE
	src.Remove(thrower)
