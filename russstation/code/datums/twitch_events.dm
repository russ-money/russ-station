/datum/world_topic/twitch_events
	require_comms_key = TRUE
	keyword = "twitch_event"

/datum/world_topic/twitch_events/Run(list/input)
	var/event = input["twitch_event"]
	var/msg = input["msg"]

	if(event == "Tsay")
		if(!msg)
			log_admin("Attempted to use Twitch Announcement, but didnt send anything.")
			message_admins("Attempted to use Twitch Announcement, but didnt send anything.")
			return

		priority_announce(msg, "Message From a Central Command Employee.") //Sends the message to everyone

		log_admin("Twitch Bot sent a command message to the station.")
		message_admins("Twich Bot sent a command message to the station.")

	if(event == "meteor")
		log_admin("Twitch Bot sent a meteor to the station.")
		message_admins("Twich Bot sent a meteor to the station.")

		if(msg == "dust")
			spawn_meteor(list(/obj/effect/meteor/dust=1))
		else if(msg == "medium")
			spawn_meteor(list(/obj/effect/meteor/medium=1))
		else if(msg == "big")
			spawn_meteor(list(/obj/effect/meteor/big=1))
		else if(msg == "flaming")
			spawn_meteor(list(/obj/effect/meteor/flaming=1))
		else if(msg == "irradiated")
			spawn_meteor(list(/obj/effect/meteor/irradiated=1))
		else if(msg == "cluster")
			spawn_meteor(list(/obj/effect/meteor/cluster=1))
		else if(msg == "cluster fragment")
			spawn_meteor(list(/obj/effect/meteor/cluster_fragment=1))
		else if(msg == "carp")
			spawn_meteor(list(/obj/effect/meteor/carp=1))
		else if(msg == "bluespace")
			spawn_meteor(list(/obj/effect/meteor/bluespace=1))
		else if(msg == "banana")
			spawn_meteor(list(/obj/effect/meteor/banana=1))
		else if(msg == "emp")
			spawn_meteor(list(/obj/effect/meteor/emp=1))
		else if(msg == "meaty")
			spawn_meteor(list(/obj/effect/meteor/meaty=1))
		else if(msg == "meaty xeno")
			spawn_meteor(list(/obj/effect/meteor/meaty/xeno=1))
		else if(msg == "tunguska")
			spawn_meteor(list(/obj/effect/meteor/tunguska=1))
		else if(msg == "pumpkin")
			spawn_meteor(list(/obj/effect/meteor/pumpkin=1))
		else
			log_admin("Attempted to use Twitch Meteor, but didnt send anything valid.")
			message_admins("Attempted to use Twitch Meteor, but didnt send anything valid.")
			return
	return
