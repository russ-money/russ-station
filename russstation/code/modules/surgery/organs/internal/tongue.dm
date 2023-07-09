/obj/item/organ/internal/tongue/skaven
	name = "putrid blistering tongue"
	desc = "The decayed tongue of a Skaven."
	icon_state = "tonguezombie"
	say_mod = "chitters"
	modifies_speech = TRUE
	disliked_foodtypes = NONE
	liked_foodtypes = GROSS | MEAT | BUGS | RAW

/obj/item/organ/internal/tongue/skaven/handle_speech(datum/source, list/speech_args)
	var/list/message_list = splittext(speech_args[SPEECH_MESSAGE], " ")
	var/maxchanges = max(round(message_list.len / 1.5), 2)

	for(var/i = rand(maxchanges / 4, maxchanges), i > 0, i--)
		var/insertpos = rand(1, message_list.len - 1)
		var/inserttext = message_list[insertpos]

		if(prob(30))
			message_list[insertpos] = inserttext + "-" + inserttext
		else if(prob(15) && message_list.len > 3)
			message_list[insertpos] = inserttext[1] + "-" + inserttext

	speech_args[SPEECH_MESSAGE] = jointext(message_list, " ")

/obj/item/organ/internal/tongue/kitsune
	name = "foxy tongue"
	desc = "A fleshy muscle mostly used for keking."
	say_mod = "keks" //????
	liked_foodtypes = MEAT | FRUIT
	disliked_foodtypes = GROSS | CLOTH | RAW

/obj/item/organ/internal/tongue/dwarf
	name = "dwarf tongue"
	desc = "it's a bit smaller than a human tongue"
	liked_foodtypes = ALCOHOL
