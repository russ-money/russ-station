/datum/language/kitsumimetic
	name = "Kitsumimetic"
	desc = "Similar to Nekomimetic in that it resembles Japanese, however this language is comprised mostly of kekkers and various screeches alongside broken syllables."
	key = "w"
	space_chance = 70
	syllables = list(
		"kitsu", "kekker", "mimi", "moe", "mofu", "fuwa", "kyaa", "kawaii", "poka", "munya",
		"puni", "munyu", "kekeke", "aaee", "icha", "doki", "kyun", "kusu", "nya", "nyaa",
		"desu", "kis", "ama", "chuu", "baka", "scree", "kraa", "gato", "kit", "sune", "yori",
		"sou", "dono", "chan", "san", "kun", "mahou", "yatta", "suki", "usagi", "domo", "ori",
		"anya", "zaazaa", "shiku", "puru", "ira", "heto", "etto"
	)
	icon = 'russstation/icons/misc/language.dmi'
	icon_state = "iconfox"
	default_priority = 90

	default_name_syllable_min = 2
	default_name_syllable_max = 2

/datum/language/kitsumimetic/get_random_name(
	gender = NEUTER,
	name_count = default_name_count,
	syllable_min = default_name_syllable_min,
	syllable_max = default_name_syllable_max,
	force_use_syllables = FALSE,
)
	if(force_use_syllables)
		return ..()

	return "[pick(GLOB.kitsune_first)] [pick(GLOB.kitsune_last)]"
