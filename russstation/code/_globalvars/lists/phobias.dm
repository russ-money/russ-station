
// At runtime we merge our own custom phobia-related stuff into the global lists.
// This works around the complexity of having to somehow integrate it without redefining the globals.
// (FYI: /world/New() runs after GLOB init according to the documentation in /code/game/world.dm)
// There is probably a better way to do this...
/world/New()
	. = ..()

	var/phobia_objs = list(
		"insects" = typecacheof(list(
			/obj/item/toy/plush/russstation/moth_lunar,
			/obj/item/toy/plush/russstation/moth_banana,
			/obj/item/toy/plush/russstation/moth_poly,
		)),

		"lizards" = typecacheof(list(
			/obj/item/toy/plush/russstation/lizard,
			/obj/item/toy/plush/russstation/lizard_spine,
			/obj/item/toy/plush/russstation/lizard_frill,
			/obj/item/toy/plush/russstation/lizard_horn
		))
	)

	for (var/phobia_type in phobia_objs)
		GLOB.phobia_objs[phobia_type] = typecacheof(unique_merge_list(GLOB.phobia_objs[phobia_type], phobia_objs[phobia_type]))
