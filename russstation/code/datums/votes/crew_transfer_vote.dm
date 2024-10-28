#define CHOICE_RESTART "Initiate Crew Transfer"
#define CHOICE_CONTINUE "Continue The Shift"

/datum/vote/crew_transfer_vote
	name = "Crew Transfer"
	default_choices = list(
		CHOICE_RESTART,
		CHOICE_CONTINUE,
	)
	vote_sound = 'russstation/sound/misc/transfer_vote.ogg'

	default_message = "Vote to call the shuttle. Can only be initiated after some time has passed."

/datum/vote/restart_vote/toggle_votable()
	CONFIG_SET(flag/transfer_vote, !CONFIG_GET(flag/transfer_vote))

/datum/vote/crew_transfer_vote/is_config_enabled()
	return CONFIG_GET(flag/transfer_vote)

/datum/vote/crew_transfer_vote/create_vote(mob/vote_creator)
	. = ..()
	if(!.)
		return

	var/srd = CONFIG_GET(number/shuttle_refuel_delay)
	if(world.time - SSticker.round_start_time < srd)
		if(vote_creator)
			to_chat(vote_creator, span_warning("Shuttle call can only initiate after [DisplayTimeText(srd - (world.time - SSticker.round_start_time))]."))
		return FALSE

	return TRUE

/datum/vote/crew_transfer_vote/get_vote_result(list/non_voters)
	if(!CONFIG_GET(flag/default_no_vote))
		// Default no votes will add non-voters to "Continue Playing"
		choices[CHOICE_CONTINUE] += length(non_voters)
	return ..()

/datum/vote/crew_transfer_vote/finalize_vote(winning_option)
	if(winning_option == CHOICE_CONTINUE)
		// Set up the next transfer vote timer
		SSvote.set_transfer_timer(CONFIG_GET(number/transfer_delay_subsequent))
		return

	if(winning_option == CHOICE_RESTART)
		// Call the shuttle
		shuttlecall()
		return

	CRASH("[type] wasn't passed a valid winning choice. (Got: [winning_option || "null"])")

/datum/vote/crew_transfer_vote/proc/shuttlecall()
	// check to prevent the vote resetting an already called shuttle
	if(EMERGENCY_IDLE_OR_RECALLED)
		SSshuttle.emergency.request()
		SSshuttle.emergency_no_recall = TRUE
		message_admins("The emergency shuttle has been requested because of a successful transfer vote.")
	else
		to_chat(world, span_boldannounce("Notice: The crew transfer vote has failed because the shuttle is unavailable"))

#undef CHOICE_RESTART
#undef CHOICE_CONTINUE
