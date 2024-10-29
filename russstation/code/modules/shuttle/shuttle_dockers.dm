// For some admemes and/or BYOS
/obj/machinery/computer/camera_advanced/shuttle_docker/russ
	essential = TRUE

/obj/machinery/computer/camera_advanced/shuttle_docker/russ/Initialize(mapload)
	. = ..()
	// Find the port set on mapload
	for (var/docking_port in SSshuttle.stationary_docking_ports)
		var/obj/docking_port/stationary/stationary_port = docking_port
		if (stationary_port.shuttle_id == shuttlePortId)
			my_port = stationary_port

/obj/machinery/computer/camera_advanced/shuttle_docker/russ/cargo
	name = "Cargo shuttle navigation computer"
	shuttleId = "cargo"
	shuttlePortId = "cargo_home"
	see_hidden = TRUE
	view_range = 5.5
	whitelist_turfs = list(/turf/)
	circuit = /obj/item/circuitboard/computer/shuttle_docker/russ/cargo

/obj/machinery/computer/camera_advanced/shuttle_docker/russ/cargo_mining
	name = "Mining shuttle navigation computer"
	shuttleId = "mining"
	shuttlePortId = "mining_home"
	see_hidden = TRUE
	view_range = 5.5
	whitelist_turfs = list(/turf/)
	circuit = /obj/item/circuitboard/computer/shuttle_docker/russ/cargo_mining

/obj/machinery/computer/camera_advanced/shuttle_docker/russ/public_mining
	name = "Public mining shuttle navigation computer"
	shuttleId = "mining_common"
	shuttlePortId = "commonmining_home"
	see_hidden = TRUE
	view_range = 5.5
	whitelist_turfs = list(/turf/)
	circuit = /obj/item/circuitboard/computer/shuttle_docker/russ/public_mining

/obj/machinery/computer/camera_advanced/shuttle_docker/russ/emergency
	name = "Emergency shuttle navigation computer"
	shuttleId = "emergency"
	shuttlePortId = "emergency_home"
	see_hidden = TRUE
	view_range = 5.5
	whitelist_turfs = list(/turf/)
	circuit = /obj/item/circuitboard/computer/shuttle_docker/russ/emergency

/obj/machinery/computer/camera_advanced/shuttle_docker/russ/arrivals
	name = "Arrivals shuttle navigation computer"
	shuttleId = "arrival"
	shuttlePortId = "arrival_stationary"
	see_hidden = TRUE
	view_range = 5.5
	whitelist_turfs = list(/turf/)
	circuit = /obj/item/circuitboard/computer/shuttle_docker/russ/arrivals

// Circuit boards
/obj/item/circuitboard/computer/shuttle_docker/russ
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	desc = "Use with utmost caution, as it holds the potential for chaos."

/obj/item/circuitboard/computer/shuttle_docker/russ/cargo
	name = "Cargo Shuttle Controller"
	build_path = /obj/machinery/computer/camera_advanced/shuttle_docker/russ/cargo

/obj/item/circuitboard/computer/shuttle_docker/russ/cargo_mining
	name = "Mining Shuttle Controller"
	build_path = /obj/machinery/computer/camera_advanced/shuttle_docker/russ/cargo_mining

/obj/item/circuitboard/computer/shuttle_docker/russ/public_mining
	name = "Public Mining Shuttle Controller"
	build_path = /obj/machinery/computer/camera_advanced/shuttle_docker/russ/public_mining

/obj/item/circuitboard/computer/shuttle_docker/russ/emergency
	name = "Emergency Shuttle Controller"
	build_path = /obj/machinery/computer/camera_advanced/shuttle_docker/russ/emergency

/obj/item/circuitboard/computer/shuttle_docker/russ/arrivals
	name = "Arrival Shuttle Controller"
	build_path = /obj/machinery/computer/camera_advanced/shuttle_docker/russ/arrivals
