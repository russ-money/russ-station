/datum/ai_controller/basic_controller/raptor/poly
	// It doesn't need a lot of these
	planning_subtrees = list(
		/datum/ai_planning_subtree/parrot_as_in_repeat,
		/datum/ai_planning_subtree/find_nearest_thing_which_attacked_me_to_flee/raptor,
		/datum/ai_planning_subtree/flee_target/from_flee_key,
		/datum/ai_planning_subtree/find_and_hunt_target/heal_raptors,
		/datum/ai_planning_subtree/random_speech/blackboard,
		/datum/ai_planning_subtree/pet_planning,
		/datum/ai_planning_subtree/target_retaliate/check_faction,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/find_and_hunt_target/raptor_trough,
		/datum/ai_planning_subtree/find_and_hunt_target/care_for_young,
		/datum/ai_planning_subtree/make_babies,
		/datum/ai_planning_subtree/find_and_hunt_target/raptor_start_trouble,
		/datum/ai_planning_subtree/express_happiness,
		/datum/ai_planning_subtree/find_and_hunt_target/play_with_owner/raptor,
	)
