/obj/item/circuitboard/machine/gacha
	name = "Gacha"
	build_path = /obj/machinery/gacha/plush
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/obj/item/stack/sheet/glass = 2
	)
	needs_anchored = FALSE

/datum/design/board/gacha
	name = "Gacha machine board"
	desc = "The circuit board for a gacha machine."
	id = "gacha_machine"
	build_path = /obj/item/circuitboard/machine/gacha
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE
