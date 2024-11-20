#define PET_OPTION_VERMIN "Vermin"
#define PET_OPTION_HYENA "Hyena"

// As with phobias, we merge these into the upstream global list at runtime.
// (/world/New() runs after global var initialization but before subsystem initialization)
/world/New()
	. = ..()

	var/pet_options = list(
		PET_OPTION_HYENA = list(
			/mob/living/basic/pet/cat/hyena,
			/mob/living/basic/pet/cat/hyena/second,
			/mob/living/basic/pet/cat/hyena/cub,
		),

		PET_OPTION_VERMIN = list(
			/mob/living/basic/mothroach/kat/death,
			/mob/living/basic/mothroach/kat/lunar,
			/mob/living/basic/mothroach/kat/snow,
			/mob/living/basic/mothroach/kat/warden
		)
	)

	for (var/pet_option in pet_options)
		if (pet_option in GLOB.pet_options)
			GLOB.pet_options[pet_option] = unique_merge_list(GLOB.pet_options[pet_option], pet_options[pet_option])
		else
			GLOB.pet_options[pet_option] = pet_options[pet_option]
