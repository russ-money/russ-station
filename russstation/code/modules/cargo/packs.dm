//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/emergency/hotrod
	name = "The Hotrod"
	desc = "High quality American steel from the ruins of Detroit, Earth. Made in the Space Republic of China."
	cost = 1500
	contains = list(/obj/vehicle/ridden/wheelchair/russ/hotrod)
	crate_name = "The Hotrod"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/emergency/sportschair
	name = "Sportschair"
	desc = "A lightweight model wheelchair."
	cost = 1500
	contains = list(/obj/vehicle/ridden/wheelchair/russ/sportschair)
	crate_name = "Sportschair"
	crate_type = /obj/structure/closet/crate/large

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Security ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/security/bearsky
	name = "Officer Bearsky Crate"
	desc = "Hunts the Syndicate like wild terrestrial salmon"
	cost = 5000
	contains = list(/mob/living/simple_animal/bot/secbot/bearsky)
	crate_name = "officer bearsky crate"
	crate_type = /obj/structure/closet/crate/critter

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Costumes & Toys /////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/costumes_toys/cowboy
	name = "Wild West Crate"
	desc = "Yeehaw pardner!"
	cost = 4000
	contains = list(
		/obj/item/clothing/head/cowboyhat,
		/obj/item/clothing/head/cowboyhat/tan,
		/obj/item/clothing/head/cowboyhat/white,
		/obj/item/clothing/head/cowboyhat/black,
		/obj/item/clothing/head/cowboyhat/pink,
		/obj/item/clothing/shoes/cowboy,
		/obj/item/clothing/shoes/cowboy,
		/obj/item/clothing/shoes/cowboy/white,
		/obj/item/clothing/shoes/cowboy/black,
		/obj/item/clothing/shoes/cowboy/pink,
		/obj/item/clothing/accessory/medal/russ/deputy,
		/obj/item/clothing/accessory/medal/russ/deputy,
		/obj/item/toy/gun,
		/obj/item/toy/gun,
		/obj/item/toy/gun,
		/obj/item/toy/gun,
		/obj/item/toy/gun,
		/obj/item/toy/gun/bigiron,
	)
	crate_name = "wild west crate"
	crate_type = /obj/structure/closet/crate/wooden

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////// Vending /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vending/monkey
	name = "Monkey Supply Crate"
	desc = "There's always more science to be done!"
	cost = CARGO_CRATE_VALUE * 3
	contains = list(
		/obj/item/vending_refill/monkey,
		/obj/item/circuitboard/machine/vending/monkey
	)
	crate_name = "monkey supply crate"

//////////////////////////////////////////////////////////////////////////////
////////////////////////////// Engineering ///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/engineering/crypto_mining_card
	name = "Basic Graphics Card"
	desc = "An old card from a simpler time when games didn't have to look fancy to be fun. Mining rig required."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/electronics/crypto_mining_card)
	crate_name = "graphics card crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical
	special = FALSE // unlocked by default

/datum/supply_pack/engineering/crypto_mining_card/tier2
	name = "Intermediate Graphics Card"
	desc = "Last year's top-tier card is this year's unwanted garbage."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/electronics/crypto_mining_card/tier2)
	special = TRUE // must be unlocked by market activity

/datum/supply_pack/engineering/crypto_mining_card/tier3
	name = "Advanced Graphics Card"
	desc = "The latest and greatest... that was in stock."
	cost = CARGO_CRATE_VALUE * 20
	contains = list(/obj/item/electronics/crypto_mining_card/tier3)
	special = TRUE // must be unlocked by market activity

/datum/supply_pack/engineering/crypto_mining_card/tier4
	name = "Experimental Graphics Card"
	desc = "A Syndicate double-agent is selling these ridiculous cards. We're not asking questions."
	cost = CARGO_CRATE_VALUE * 30
	contains = list(/obj/item/electronics/crypto_mining_card/tier4)
	special = TRUE // must be unlocked by market activity

/datum/supply_pack/engineering/rapid_lighting_device // this is a engi item why isn't it here tg
	name = "Rapid Lighting Device (RLD) Multi-Pack"
	desc = "Devices used to rapidly provide lighting sources to an area. Reload with iron, plasteel, glass or compressed matter cartridges."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/construction/rld = 3)

//////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Livestock ////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/critter/hyena
	name = "Hyena Crate"
	desc = "The hyena goes HA! Comes with a collar and a squeaky chew toy! Cheeseburger still not included (she'd laugh at it anyway)."
	cost = CARGO_CRATE_VALUE * 4 //Cats are worth as much as corgis.
	contains = list(
		/mob/living/basic/pet/cat/hyena,
		/obj/item/clothing/neck/petcollar,
		/obj/item/toy/cattoy,
	)
	crate_name = "hyena crate"

/datum/supply_pack/critter/hyena/generate()
	. = ..()
	var/mob/living/basic/pet/cat/hyena/del_yeen = locate() in .
	if(!isnull(del_yeen))
		qdel(del_yeen)
	switch(rand(1,4))
		if(1)
			new /mob/living/basic/pet/cat/hyena(.)
		if(2)
			new /mob/living/basic/pet/cat/hyena/second(.)
		if(3)
			new /mob/living/basic/pet/cat/hyena/cub(.)
		if(4)
			if(prob(50))
				new /mob/living/basic/pet/cat/hyena/might(.)
			else
				new /mob/living/basic/pet/cat/hyena/breadyeen(.)

/datum/supply_pack/critter/mothroach
	contains = list(
		/mob/living/basic/mothroach
	)

/datum/supply_pack/critter/mothroach/generate()
	. = ..()
	var/mob/living/basic/mothroach/del_mothroach = locate() in .
	if(!isnull(del_mothroach))
		qdel(del_mothroach)
	switch(rand(1,6))
		if(1)
			new /mob/living/basic/mothroach(.)
		if(2)
			new /mob/living/basic/mothroach/kat/death(.)
		if(3)
			new /mob/living/basic/mothroach/kat/cult(.)
		if(4)
			new /mob/living/basic/mothroach/kat/lunar(.)
		if(5)
			new /mob/living/basic/mothroach/kat/warden(.)
		if(6)
			new /mob/living/basic/mothroach/kat/snow(.)
