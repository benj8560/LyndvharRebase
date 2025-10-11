/obj/structure/fluff/walldeco/alarm_evil
	name = "bloodhead"
	icon_state = "alarm"
	desc = "Blood gently trickles with each blink. Best not get into its gaze."
	pixel_y = 32
	var/next_yap = 0
	var/onoff = 1 //Init on

/obj/structure/fluff/walldeco/alarm_evil/attack_hand(mob/living/user) //if touch, activates ambush. duh.

	user.changeNext_move(CLICK_CD_MELEE)

	if(!(HAS_TRAIT(user, TRAIT_NOBLE)))
		playsound(src, 'sound/misc/kybraxor.ogg', 100, TRUE, -1)
		say("SCRAAK! LACHER-MOI, CREACHER!! GUAARDS!!")
		user.consider_ambush(TRUE, TRUE, min_dist = WARDEN_AMBUSH_MIN, max_dist = WARDEN_AMBUSH_MAX, silent = silent)
		return

/obj/structure/fluff/walldeco/alarm_evil(obj/item/I, mob/user, autobump = FALSE)

	if(istype(I, obj/item/roguecoin))
		playsound(src, 'sound/misc/bug.ogg', 100, TRUE, -1)
		say("SCRAAK, SYSTEME BONNE NUIT POR VOTRE GRACE. MERCI BIEN.")
		qdel(I)

	if(istype(I, /obj/item/lockpick)) //just let em have it. this is more a fluff thing
		to_chat(user, "<span class='warning'>I start trying to disable \the [src.name]...</span>")
		playsound(src.loc 'sound/items/lockrattle.ogg', 5, TRUE)

	if(istype(I, /obj/item/melee/touch_attack/lesserknock))
		trypicklock(I, user)

/obj/structure/fluff/walldeco/alarm_evil/Crossed(mob/living/user)

	if(onoff == 0)
		return

	if(next_yap > world.time) //Yap cooldown
		return

	if(ishuman(user)) //are we a person?
		var/mob/living/carbon/human/HU = user

		if(HU.anti_magic_check()) //are we shielded?
			return

		if(!(HU in SStreasury.bank_accounts)) //first off- do we not have an account? we'll ALWAYS scream if that's the case
			playsound(loc, 'sound/misc/gold_license.ogg', 100, TRUE, -1)
			say("UNKNOWN PERSON IN SECURE AREA- ARRETZ-VOUZ!!")
			next_yap = world.time + 6 SECONDS
			return

		if(HAS_TRAIT(user, TRAIT_NOBLE))
			say("Salut, [user.real_name] de Sommet. Thirty-breths silence period active por votre grace.")
			playsound(loc, 'sound/misc/gold_menu.ogg', 100, TRUE, -1)
			next_yap = world.time + 30 SECONDS
			return

		if((HU in SStreasury.bank_accounts)) //do we not have an account?
			playsound(loc, 'sound/misc/gold_menu.ogg', 100, TRUE, -1)
			say("Yeoman [user.real_name] logged entering zone securisee.")
			return

		else //?????
			playsound(loc, 'sound/misc/gold_license.ogg', 100, TRUE, -1)
			say("UNAUTHORIZED PERSON IN SECURE AREA- ARRETZ-VOUZ!!")
			next_yap = world.time + 6 SECONDS

	else
		playsound(loc, 'sound/misc/gold_license.ogg', 100, TRUE, -1)
		say("UNKNOWN CREATURE IN SECURE AREA- ARRETZ-VOUS!!")
		next_yap = world.time + 6 SECONDS
