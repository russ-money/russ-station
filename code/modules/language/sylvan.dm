// The language of the podpeople. Yes, it's a shameless ripoff of elvish.
/datum/language/sylvan
	name = "Sylvan"
	desc = "A complicated, ancient language spoken by sentient plants."
	key = "h"
	space_chance = 20
	syllables = list(
		"fii", "sii", "rii", "rel", "maa", "ala", "san", "tol", "tok", "dia", "eres",
		"fal", "tis", "bis", "qel", "aras", "losk", "rasa", "eob", "hil", "tanl", "aere",
		"fer", "bal", "pii", "dala", "ban", "foe", "doa", "cii", "uis", "mel", "wex",
		"incas", "int", "elc", "ent", "aws", "qip", "nas", "vil", "jens", "dila", "fa",
		"la", "re", "do", "ji", "ae", "so", "qe", "ce", "na", "mo", "ha", "yu"
	)
	icon_state = "plant"
	default_priority = 90

// Honk Start - Diona names
	default_name_syllable_min = 2
	default_name_syllable_max = 2

/datum/language/sylvan/get_random_name(
	gender = NEUTER,
	name_count = default_name_count,
	syllable_min = default_name_syllable_min,
	syllable_max = default_name_syllable_max,
	force_use_syllables = FALSE,
)
	if(force_use_syllables)
		return ..()

	return "[pick(GLOB.diona_first)] [pick(GLOB.diona_last)]"
// Honk End
