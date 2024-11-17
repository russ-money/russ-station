GLOBAL_LIST_INIT(russstation_phobia_objs, list(
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
))

// We need the initialization code to run *after* globals have been initialized
// to ensure we only merge our list after the upstream list has been defined.
// Subsystems run after global var init, so why not (ab)use them?
SUBSYSTEM_DEF(russstation_phobia_mixin)
	name = "RussStation Phobia Mixin"
	flags = SS_NO_FIRE

// At runtime we merge our own custom phobia-related stuff into the global lists.
// This works around the complexity of having to somehow integrate it without redefining the globals.
// There is probably a better way to do this...
/datum/controller/subsystem/russstation_phobia_mixin/Initialize()
	for (var/phobia_type in GLOB.russstation_phobia_objs)
		GLOB.phobia_objs[phobia_type] = typecacheof(unique_merge_list(GLOB.phobia_objs[phobia_type], GLOB.russstation_phobia_objs[phobia_type]))

	return SS_INIT_SUCCESS
