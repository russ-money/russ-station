/datum/hud/dextrous/health_doll/New(mob/living/owner)
	..()
	healthdoll = new /atom/movable/screen/healthdoll/living(null, src)
	infodisplay += healthdoll
