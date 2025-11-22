/mob/living/carbon/human/species/galotian
	race = /datum/species/galotian

/datum/species/galotian
	name = "Galotian"
	id = "galotian"
	desc = "<b>Galotian</b><br>\
		WIP<br>"
	default_color = "SKIN_COLOR_WORKER"
	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		LIPS,
		HAIR,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	attack_verb = "slash"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	possible_ages = ALL_AGES_LIST
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mslm.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fslm.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female
	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,-1), \
		)
	//race_bonus = list(STAT_PERCEPTION = 1, STAT_CONSTITUTION = 1)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/wild_tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		)
	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/galotian,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/organ/horns/anthro,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/breasts/galotian,
		/datum/customizer/organ/vagina/galotian,
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
		/datum/body_marking_set/belly,
		/datum/body_marking_set/bellysocks,
		/datum/body_marking_set/tiger,
		/datum/body_marking_set/tiger_dark,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/plain,
		/datum/body_marking/tiger,
		/datum/body_marking/tiger/dark,
		/datum/body_marking/sock,
		/datum/body_marking/socklonger,
		/datum/body_marking/tips,
		/datum/body_marking/bellyscale,
		/datum/body_marking/bellyscaleslim,
		/datum/body_marking/bellyscalesmooth,
		/datum/body_marking/bellyscaleslimsmooth,
		/datum/body_marking/buttscale,
		/datum/body_marking/belly,
		/datum/body_marking/bellyslim,
		/datum/body_marking/butt,
		/datum/body_marking/tie,
		/datum/body_marking/tiesmall,
		/datum/body_marking/backspots,
		/datum/body_marking/front,
		/datum/body_marking/drake_eyes,
		/datum/body_marking/tonage,
		/datum/body_marking/spotted,
		/datum/body_marking/nose,
	)
	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/skin_all,
		/datum/descriptor_choice/voice,
	)

/datum/species/galotian/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/galotian/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/galotian/check_roundstart_eligible()
	return TRUE

/datum/species/galotian/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/human/galotian/get_skin_list()
	return list(
		"Worker" = SKIN_COLOR_WORKER

	)

/datum/species/human/galotian/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"brown - mud" = "362e25",
	"brown - oats" = "584a3b",
	"brown - grain" = "58433b",
	"brown - soil" = "48322a",

	"red - berry" = "48322a",
	"red - wine" = "82534c",
	"red - sunset" = "82462b",
	"red - blood" = "822b2b",

	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "8f8766",
	"blond - strawberry" = "977033"

	))

/datum/species/human/galotian/random_name(gender,unique,lastname)
	var/list/names
	if(gender == MALE)
		names = world.file2list('strings/rt/names/galotian/mslm.txt')
	else
		names = world.file2list('strings/rt/names/galotian/fslm.txt')

	var/randname
	if(unique)
		for(var/i in 1 to 10)
			randname = pick(names)
			if(!findname(randname))
				break
	else
		randname = pick(names)
	return randname

/datum/species/human/galotian/random_surname()
	return ""

// Galotian-specific hair styles using Slime_Hair.dmi
/datum/sprite_accessory/hair/head/galotian
	abstract_type = /datum/sprite_accessory/hair/head/galotian
	icon = 'icons/roguetown/mob/slime_hair.dmi'

/datum/sprite_accessory/hair/head/galotian/slimerite
	name = "Slime Bob"
	icon_state = "slimerite"

/datum/sprite_accessory/hair/head/galotian/slimerite2
	name = "Slime Short A"
	icon_state = "slimerite2"

/datum/sprite_accessory/hair/head/galotian/slimerite3
	name = "Slime Short B"
	icon_state = "slimerite3"

/datum/sprite_accessory/hair/head/galotian/slimeburns
	name = "Slime Burns"
	icon_state = "slimeburn"

/datum/sprite_accessory/hair/head/galotian/slimeside
	name = "Slime Side Hair"
	icon_state = "slimeside"

/datum/sprite_accessory/hair/head/galotian/slimeside2 // Corrected: Unique type path
	name = "Slime Side Hair N"
	icon_state = "slimeside2"

/datum/sprite_accessory/hair/head/galotian/slimebedhair // Corrected: Unique type path
	name = "Slime Bed Hair"
	icon_state = "slimebedhair"

/datum/sprite_accessory/hair/head/galotian/slimewretch // Corrected: Unique type path
	name = "Slime Wretch"
	icon_state = "slimewretch"

// Customizer to make the hair styles available in character creation for Galotians.
/datum/customizer_choice/bodypart_feature/hair/head/galotian
	name = "Hair"
	sprite_accessories = list(/datum/sprite_accessory/hair/head/bald, 
	/datum/sprite_accessory/hair/head/galotian/slimerite,
	/datum/sprite_accessory/hair/head/galotian/slimerite2, 
	/datum/sprite_accessory/hair/head/galotian/slimerite3, 
	/datum/sprite_accessory/hair/head/galotian/slimeside, 
	/datum/sprite_accessory/hair/head/galotian/slimeside2,
	/datum/sprite_accessory/hair/head/galotian/slimeburns,
	/datum/sprite_accessory/hair/head/galotian/slimewretch, 
	/datum/sprite_accessory/hair/head/galotian/slimebedhair)

/datum/customizer/bodypart_feature/hair/head/galotian
	customizer_choices = list(/datum/customizer_choice/bodypart_feature/hair/head/galotian)

// Galotian-specific organs

// Breasts
/datum/sprite_accessory/organ/breasts/galotian
	abstract_type = /datum/sprite_accessory/organ/breasts/galotian
	icon = 'icons/roguetown/mob/slime_organs1.dmi'
	var/breast_size

/datum/sprite_accessory/organ/breasts/galotian/size_flat
	name = "Flat"
	breast_size = 0
	icon_state = "slime_0_FRONT"

/datum/sprite_accessory/organ/breasts/galotian/size_very_small
	name = "Very Small"
	breast_size = 1
	icon_state = "slime_1_ADJ"

/datum/sprite_accessory/organ/breasts/galotian/size_small
	name = "Small"
	breast_size = 2
	icon_state = "slime_2_ADJ"

/datum/sprite_accessory/organ/breasts/galotian/size_normal
	name = "Normal"
	breast_size = 3
	icon_state = "slime_3_ADJ"

/datum/sprite_accessory/organ/breasts/galotian/size_large
	name = "Large"
	breast_size = 4
	icon_state = "slime_4_ADJ"

/datum/sprite_accessory/organ/breasts/galotian/size_enormous
	name = "Enormous"
	breast_size = 5
	icon_state = "slime_5_ADJ"

/datum/customizer_choice/organ/breasts/galotian
	name = "Breasts"
	sprite_accessories = list(
		/datum/sprite_accessory/organ/breasts/galotian/size_flat,
		/datum/sprite_accessory/organ/breasts/galotian/size_very_small,
		/datum/sprite_accessory/organ/breasts/galotian/size_small,
		/datum/sprite_accessory/organ/breasts/galotian/size_normal,
		/datum/sprite_accessory/organ/breasts/galotian/size_large,
		/datum/sprite_accessory/organ/breasts/galotian/size_enormous
	)

/datum/customizer/organ/breasts/galotian
	customizer_choices = list(/datum/customizer_choice/organ/breasts/galotian)

// Penis
/datum/sprite_accessory/organ/penis/galotian
	abstract_type = /datum/sprite_accessory/organ/penis/galotian
	icon = 'icons/roguetown/mob/slime_organs3.dmi'
	var/penis_size

/datum/sprite_accessory/organ/penis/galotian/size_small
	name = "Small"
	penis_size = 1
	icon_state = "slime_1_FRONT"

/datum/sprite_accessory/organ/penis/galotian/size_normal
	name = "Normal"
	penis_size = 2
	icon_state = "slime_2_FRONT"

/datum/sprite_accessory/organ/penis/galotian/size_large
	name = "Large"
	penis_size = 3
	icon_state = "slime_3_FRONT"

/datum/customizer_choice/organ/penis/galotian
	name = "Penis"
	sprite_accessories = list(/datum/sprite_accessory/organ/penis/galotian/size_small, 
	/datum/sprite_accessory/organ/penis/galotian/size_normal, 
	/datum/sprite_accessory/organ/penis/galotian/size_large)

/datum/customizer/organ/penis/galotian
	customizer_choices = list(/datum/customizer_choice/organ/penis/galotian)

// Vagina
/datum/sprite_accessory/organ/vagina/galotian
	abstract_type = /datum/sprite_accessory/organ/vagina/galotian
	icon = 'icons/roguetown/mob/slime_organs3.dmi'

/datum/sprite_accessory/organ/vagina/galotian/normal
	name = "Normal"
	icon_state = "slime_FRONT"

/datum/customizer_choice/organ/vagina/galotian
	name = "Vagina"
	sprite_accessories = list(/datum/sprite_accessory/organ/vagina/galotian/normal)

/datum/customizer/organ/vagina/galotian
	customizer_choices = list(/datum/customizer_choice/organ/vagina/galotian)
