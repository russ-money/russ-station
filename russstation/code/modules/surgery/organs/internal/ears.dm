/obj/item/organ/internal/ears/skaven
	name = "skaven ears"
	icon = 'russstation/icons/obj/clothing/hats.dmi'
	icon_state = "skaven"
	visual = TRUE

/obj/item/organ/internal/ears/skaven/on_mob_insert(mob/living/carbon/human/ear_owner)
	. = ..()
	if(istype(ear_owner) && ear_owner.dna)
		color = ear_owner.dna.features["skaven_color"]
		ear_owner.dna.features["ears"] = ear_owner.dna.species.mutant_bodyparts["ears"] = "Skaven"
		ear_owner.dna.update_uf_block(DNA_EARS_BLOCK)
		ear_owner.update_body()

/obj/item/organ/internal/ears/skaven/on_mob_remove(mob/living/carbon/human/ear_owner)
	. = ..()
	if(istype(ear_owner) && ear_owner.dna)
		color = ear_owner.hair_color
		ear_owner.dna.species.mutant_bodyparts -= "ears"
		ear_owner.update_body()

/obj/item/organ/internal/ears/kitsune
	name = "fox ears"
	icon = 'russstation/icons/obj/clothing/hats.dmi'
	icon_state = "foxie"
	visual = TRUE
	damage_multiplier = 2

/obj/item/organ/internal/ears/kitsune/on_mob_insert(mob/living/carbon/human/ear_owner)
	. = ..()
	if(istype(ear_owner) && ear_owner.dna)
		color = ear_owner.hair_color
		ear_owner.dna.features["ears"] = ear_owner.dna.species.mutant_bodyparts["ears"] = "Kitsune"
		ear_owner.dna.update_uf_block(DNA_EARS_BLOCK)
		ear_owner.update_body()

/obj/item/organ/internal/ears/kitsune/on_mob_remove(mob/living/carbon/human/ear_owner)
	. = ..()
	if(istype(ear_owner) && ear_owner.dna)
		color = ear_owner.hair_color
		ear_owner.dna.species.mutant_bodyparts -= "ears"
		ear_owner.update_body()
