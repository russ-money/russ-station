/datum/language/dwarvish
	name = "Dwarven"
	icon = 'russstation/icons/misc/language.dmi'
	desc = "The secret language of the Dwarves."
	key = "5"
	flags = TONGUELESS_SPEECH
	space_chance = 30
	syllables = list(
		"kulet", "alak", "bidok", "urist", "anam", "gatal", "bemong", "gost",
		"izeg", "ontak", "berim", "ibruk", "kogan", "usan", "tosid", "feb",
		"gostang", "ermith", "toth", "biban", "ugog", "ish", "robek", "olmul",
		"nokzam", "emuth", "fer", "uvel", "agek", "ucat", "enir", "ugath", "etang",
		"uroth", "erong", "osed", "nazush", "atrid", "erith", "kalur", "tholtod",
		"thol", "todir", "melbil", "dishmab", "atul", "etul", "stul",
	)
	icon_state = "dwarf"
	default_priority = 90

	default_name_syllable_min = 2
	default_name_syllable_max = 2


/datum/language/dwarvish/get_random_name(
	gender = NEUTER,
	name_count = default_name_count,
	syllable_min = default_name_syllable_min,
	syllable_max = default_name_syllable_max,
	force_use_syllables = FALSE,
)
	if(force_use_syllables)
		return ..()

	return "[pick(GLOB.dwarf_first)] [pick(GLOB.dwarf_last)]"
