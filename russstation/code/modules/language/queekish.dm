//The skaven language
/datum/language/queekish
	name = "Queekish"
	icon = 'russstation/icons/misc/language.dmi'
	desc = "The chittering and hasty language of the Skaven, spoken with rapid squeaks trills and often littered with short, clipped words."
	key = "s"
	flags = TONGUELESS_SPEECH
	space_chance = 60
	sentence_chance = 20
	syllables = list(
		"itt", "olk", "att", "rat", "ektrik", "iskit", "itch", "eek",
		"akt", "ittak", "eepus", "erkit", "atch", "anquisk", "atchitt", "ek",
		"arrat", "ittar", "ot", "ittr", "aknaw", "ordkin", "eekit", "eet",
		"eep", "ictus", "ilik", "yre", "olkin", "etch", "isk", "rit",
		"eesik", "eshin", "ol", "skr", "skre", "spl", "skarak", "attikt",
		"ittk", "ekak", "kra", "ka", "kak", "eshinik", "ikac", "scrawl",
	)
	icon_state = "queek"
	default_priority = 90

	default_name_syllable_min = 2
	default_name_syllable_max = 2


/datum/language/queekish/get_random_name(
	gender = NEUTER,
	name_count = default_name_count,
	syllable_min = default_name_syllable_min,
	syllable_max = default_name_syllable_max,
	force_use_syllables = FALSE,
)
	if(force_use_syllables)
		return ..()

	return "[pick(GLOB.skaven_first)] [pick(GLOB.skaven_last)]"
