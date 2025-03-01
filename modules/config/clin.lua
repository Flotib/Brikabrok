--[[

        _______      ______   ______ _____ _     _ _______ ______   ______  _____  _     _
 |      |______      |_____] |_____/   |   |____/  |_____| |_____] |_____/ |     | |____/ 
 |_____ |______      |_____] |    \_ __|__ |    \_ |     | |_____] |    \_ |_____| |    \_
                                                                                          

    MIT License

    Copyright (c) 2018 BinarySpace

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

--]]

local Brikabrok = LibStub("AceAddon-3.0"):GetAddon("Brikabrok")
local StdUi = LibStub('StdUi');


brikabrokGlances = {
		["AUR00001"] = { -- Test 1
			["Description"] = "Un état vide, sans aucune données.",
			["Nom"] = "État",
			["bAjout"] = false,
		},
		-----------------------
		-- BORDEL : 00010 à 00100
		-----------------------
		["AUR00010"] = { -- Vêtement en feu
			["Type"] = 1,
			["Description"] = "Une partie des vêtements de ce personnage sont en flammes.",
			["Nom"] = "Vêtements en feu",
			["OnLifeTimeEffet"] = "texte$Vos vêtements ne sont plus en flammes.$1;",
			["Createur"] = "Telkostrasz",
			["OnUpdateCondi"] = "rand$<=$20;",
			["Icone"] = "INV_Fabric_Spellfire",
			["OnUpdateEffet"] = "aura$AUR00011$0$1$1;",
			["OnReceiveEffet"] = "parole$voit ses vêtements prendre feu !$2;texte${r}Vos vêtements prennent feu !$3;son$Sound\\\\Spells\\\\FireWardTarget.wav$2$12;",
		},
		["AUR00011"] = { -- Blessure : Brulure fraiche
			["Nom"] = "Brûlure fraîche",
			["Type"] = 1,
			["EtatCat"] = 7,
			["Description"] = "Ce personnage a récemment été brûlé. Cette brûlure n'a pas encore été traitée.",
			["Icone"] = "Spell_Fire_Incinerate",
			["Createur"] = "Telkostrasz",
			["OnDestroyEffet"] = "texte$Votre brûlure est guérie.$1;",
		},
		["AUR00012"] = { -- Plaie à l'oeil gauche
			["Type"] = 1,
			["Description"] = "Une coupure légère au niveau de l'oeil gauche.\nVisibilité réduite.",
			["Icone"] = "Ability_Rogue_BloodyEye",
			["EtatCat"] = 7,
			["Nom"] = "Plaie à l'oeil gauche",
			["Createur"] = "Telkostrasz",
		},
		["AUR00013"] = { -- Plaie à l'oeil droit
			["Type"] = 1,
			["Description"] = "Une coupure légère au niveau de l'oeil droit.\nVisibilité réduite.",
			["Icone"] = "Ability_Rogue_BloodyEye",
			["EtatCat"] = 7,
			["Nom"] = "Plaie à l'oeil droit",
			["Createur"] = "Telkostrasz",
		},
		
		["AUR00014"] = { -- Fumée du sèche-cheveux
			["EtatCat"] = 12,
			["Type"] = 1,
			["Description"] = "Cette personne est couverte d'une épaisse couche de poussières et de cendres.",
			["Date"] = "25/05/11, 00:26:07 par Telkostrasz",
			["Nom"] = "Poussières et cendres",
			["Createur"] = "Telkostrasz",
			["OnUpdateCondi"] = "isswimming$==$\"1\";",
			["Icone"] = "inv_misc_dust",
			["DureeDefaut"] = 20,
			["OnUpdateEffet"] = "aura$AUR00014$0$2$1;texte${me} est maintenant propre après son passage dans l'eau.$1;son$Sound\\\\Spells\\\\WaterElementalLow_Imapct_Base2.wav$1$0;",
		},
		-----------------------
		-- Humeur et emotions et comportements : 00501 à 00550
		-----------------------
		-- Comportement
		["AUR00501"] = { -- Apathique
			["Createur"] = "Telkosträsz",
			["Description"] = "Ce personnage est mou, totalement amorphe.",
			["Icone"] = "Spell_Shadow_MindSteal",
			["Nom"] = "Apathique",
			["EtatCat"] = 5,
		},
		["AUR00511"] = { -- Calme
			["Createur"] = "Telkosträsz",
			["Description"] = "Ce personnage est calme.",
			["Icone"] = "Ability_Mage_PotentSpirit",
			["Nom"] = "Calme",
			["EtatCat"] = 5,
		},
		["AUR00512"] = { -- Agité
			["Createur"] = "Telkosträsz",
			["Description"] = "Ce personnage est très agité. Il ne tient pas en place.",
			["Icone"] = "Achievement_BG_captureflag_EOS",
			["Nom"] = "Agité",
			["EtatCat"] = 5,
		},
		["AUR00509"] = { -- Dans la lune
			["Createur"] = "Ænys",
			["Description"] = "Ce personnage est dans la lune, perdu dans ses pensées.",
			["Icone"] = "Ability_Druid_Eclipse",
			["Nom"] = "Dans la lune",
			["EtatCat"] = 5,
		},
		["AUR00504"] = { -- Aux aguets
			["Description"] = "Ce personnage est attentif à tout ce qui se passe autour de lui ... Il peut être très réactif en cas de problème.",
			["Icone"] = "Ability_Druid_SupriseAttack",
			["Nom"] = "Aux aguets",
			["Createur"] = "Elindorië",
			["EtatCat"] = 5,
		},
		["AUR00513"] = { -- Observateur
			["Createur"] = "Kâsu",
			["Description"] = "Ce personnage observe tranquillement les gens autours de lui en faisant attention aux moindres détails.",
			["Icone"] = "ACHIEVEMENT_GUILDPERK_EVERYONES A HERO_RANK2",
			["Nom"] = "Observateur",
			["EtatCat"] = 5,
		},
		["AUR00514"] = { -- Timbré
			["Createur"] = "Anundæl",
			["Description"] = "Ce personnage a peut-être une case en moins, une pathologie particulière ou une mentalité hors des sentiers battus. Mieux vaut garder ses distances.",
			["Icone"] = "INV_Misc_Ticket_Tarot_Madness",
			["Nom"] = "Timbré",
			["EtatCat"] = 5,
		},
		["AUR00516"] = { -- Farceur
			["Createur"] = "Fimble",
			["Description"] = "Toujours prêt à rire de quelque chose ou quelqu'un, ou à tourner des paroles en ridicule.",
			["Icone"] = "Achievement_Character_Gnome_Male",
			["Nom"] = "Farceur",
			["EtatCat"] = 5,
		},
		["AUR00518"] = { -- Ivre
			["Createur"] = "Telkostrasz",
			["Description"] = "Ce personnage est complèment ivre !",
			["Icone"] = "INV_Drink_29_SunkissedWine",
			["Nom"] = "Ivre mort",
			["EtatCat"] = 5,
			["Type"] = 1,
		},
		-- Humeur
		["AUR00517"] = { -- Amoureux
			["Createur"] = "Märion",
			["Description"] = "Ce personnage est amoureux, et cela se voit !",
			["Icone"] = "Achievement_WorldEvent_Valentine",
			["Nom"] = "Amoureux",
			["EtatCat"] = 6,
		},
		["AUR00502"] = { -- Content
			["Createur"] = "Telkosträsz",
			["Description"] = "Ce personnage est heureux et de bonne humeur.",
			["Icone"] = "Spell_Shaman_GiftEarthmother",
			["Nom"] = "Content",
			["EtatCat"] = 6,
		},
		["AUR00505"] = { -- Colère
			["Createur"] = "Telkosträsz",
			["Description"] = "Ce personnage est en colère.",
			["Icone"] = "Spell_Misc_EmotionAngry",
			["Nom"] = "En colère",
			["EtatCat"] = 6,
		},
		["AUR00506"] = { -- Triste
			["Createur"] = "Telkosträsz",
			["Description"] = "Ce personnage est triste.",
			["Icone"] = "Spell_Misc_EmotionSad",
			["Nom"] = "Triste",
			["EtatCat"] = 6,
		},
		["AUR00508"] = { -- Impassible
			["Createur"] = "Telkosträsz",
			["Description"] = "Quelle que soit son humeur, ce personnage la cache derrière un visage fermé et inexpressif.",
			["Icone"] = "Ability_Rogue_Disguise",
			["Nom"] = "Impassible",
			["EtatCat"] = 6,
		},
		["AUR00510"] = { -- Affectueux
			["Createur"] = "Telkosträsz",
			["Description"] = "Ce personnage montre de affection à tout ce qui l'entoure.",
			["Icone"] = "INV_ValentinesCandy",
			["Nom"] = "Affectueux",
			["EtatCat"] = 6,
		},
		
		-- ACTION
		["AUR00515"] = { -- Fume le cigare
			["Createur"] = "Darnat",
			["Description"] = "Qui a dit que fumer nuisait à la santé ?",
			["Icone"] = "INV_Misc_Flute_01",
			["Nom"] = "Fume le cigare",
			["EtatCat"] = 13,
		},
		
		-- Odeur : 00551 à 00600
		["AUR00551"] = { -- Sang
			["Createur"] = "Telkostrasz",
			["Description"] = "Ce personnage est poursuivi par une odeur de sang séché.",
			["Icone"] = "Spell_Shadow_BloodBoil",
			["Nom"] = "Odeur de sang",
			["EtatCat"] = 4,
		},
		["AUR00552"] = { -- Tabac
			["Createur"] = "Telkostrasz",
			["Description"] = "Une vieille odeur de tabac froid émane de ce personnage.",
			["Icone"] = "INV_Misc_Dust_02",
			["Nom"] = "Odeur de tabac",
			["EtatCat"] = 4,
		},
		["AUR00553"] = { -- Fromage
			["Createur"] = "Telkostrasz",
			["Description"] = "Ce personnage sent le fromage fort !",
			["Icone"] = "INV_Misc_Food_03",
			["Nom"] = "Odeur de fromage",
			["EtatCat"] = 4,
		},
		["AUR00554"] = { -- Rose
			["Description"] = "Une odeur de rose émane de ce personnage.",
			["Icone"] = "INV_RoseBouquet01",
			["Nom"] = "Odeur de rose",
			["Createur"] = "Ulra",
			["EtatCat"] = 4,
		},
		["AUR00555"] = { -- Printemps
			["Createur"] = "Bérénisse",
			["Description"] = "Une fraiche odeur fleurie et légère émane de cette personne.",
			["Icone"] = "INV_Misc_TrailofFlowers",
			["Nom"] = "Odeur du printemps",
			["EtatCat"] = 4,
		},
		["AUR00556"] = { -- Foret
			["Description"] = "Une odeur de fleur pafumée, de forêt et d'une piquante et fraiche rosée se fait sentir sur ce personnage.",
			["Icone"] = "Ability_Druid_Flourish",
			["Nom"] = "Odeur de la forêt",
			["Createur"] = "Nandieb",
			["EtatCat"] = 4,
		},
		["AUR00557"] = { -- Cadavre
			["Description"] = "Ce personnage dégage une odeur de cadavre en putréfaction.",
			["Icone"] = "Spell_Shadow_DeathCoil",
			["Nom"] = "Odeur de cadavre",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 4,
		},
		["AUR00558"] = { -- Œuf pourri
			["Description"] = "Ce personnage dégage une atroce odeur d'œuf pourri.",
			["Icone"] = "Achievement_Halloween_RottenEgg_01",
			["Nom"] = "Odeur d'œuf pourri",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 4,
		},
		["AUR00559"] = { -- Viande fraiche
			["Description"] = "Une belle odeur de viande fraiche émane de ce personnage.",
			["Icone"] = "INV_Misc_Food_Meat_Raw_03",
			["Nom"] = "Odeur de viande fraiche",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 4,
		},
		["AUR00560"] = { -- Poisson
			["Description"] = "Ce personnage sent le poisson frais !",
			["Icone"] = "INV_Misc_Fish_17",
			["Nom"] = "Odeur de poisson frais",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 4,
		},
		["AUR00561"] = { -- Mer
			["Description"] = "Une fine odeur d'eau salée et de crustacé émane de cette personne.",
			["Icone"] = "INV_Misc_Fish_15",
			["Nom"] = "Odeur de la mer",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 4,
		},
		["AUR00562"] = { -- Animal
			["Description"] = "Ce personnage dégage une odeur d'animal.",
			["Icone"] = "Ability_Hunter_CatlikeReflexes",
			["Nom"] = "Odeur d'animal",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 4,
		},
		
		-- Maladie 00601 à 00700
		["AUR00601"] = { -- Rhume
			["Description"] = "Ce personnage montre les symptômes d'un gros rhume : nez qui coule, toux passagère et parfois des petites montées de fièvre.",
			["Icone"] = "INV_Elemental_Mote_Water01",
			["Nom"] = "Rhume",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 8,
			["Type"] = 1,
		},
		["AUR00602"] = { -- Asthme
			["Description"] = "Cette personne est très rapidemment essouflée. Elle souffre aussi de crises d'asthme passagères.",
			["Icone"] = "inv_misc_volatileair",
			["Nom"] = "Asthme",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 8,
			["Type"] = 1,
		},
		
		
		-- Malédictions 00701 à 00800
		["AUR00701"] = { -- Malédiction de douleur
			["Description"] = "Des illusions dévorent le corps de cette personne, mais la douleur est bien réelle...",
			["Icone"] = "Ability_Vanish",
			["Nom"] = "Malédiction de douleur",
			["Createur"] = "Knilthas",
			["EtatCat"] = 9,
			["Type"] = 1,
		},
		["AUR00702"] = { -- Malédiction de désespoir
			["Description"] = "Des voix internes rabaissent sans arrêt ce personnage.",
			["Icone"] = "Spell_Holy_PrayerofShadowProtection",
			["Nom"] = "Malédiction de désespoir",
			["Createur"] = "Knilthas",
			["EtatCat"] = 9,
			["Type"] = 1,
		},
		["AUR00703"] = { -- Malédiction de l'ombre
			["Description"] = "Tout sort de soin dirigé vers ce personnage le blesse.",
			["Icone"] = "Ability_Rogue_EnvelopingShadows",
			["Nom"] = "Malédiction de l'ombre",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 9,
			["Type"] = 1,
		},
		
		-- Magie 00801 à 00900
		["AUR00801"] = { -- Silence
			["Description"] = "Une magie empêche ce personnage d'incanter des sorts.",
			["Icone"] = "SPELL_HOLY_SILENCE",
			["Nom"] = "Silence",
			["Createur"] = "Knilthas",
			["EtatCat"] = 10,
			["Type"] = 1,
		},
		["AUR00802"] = { -- Miniature
			["Description"] = "Une magie a diminué la taille de ce personnage !",
			["Icone"] = "INV_Gizmo_Poltryiser_01",
			["Nom"] = "Miniaturisé",
			["Createur"] = "Knilthas",
			["EtatCat"] = 10,
			["Type"] = 1,
		},
		["AUR00803"] = { -- Lenteur
			["Description"] = "Des chaines magiques sont appliquées aux membres moteurs de ce personnage. Il est ralenti dans ses mouvements.",
			["Icone"] = "Spell_Nature_TimeStop",
			["Nom"] = "Lenteur",
			["Createur"] = "Knilthas",
			["EtatCat"] = 10,
			["Type"] = 1,
		},
		["AUR00804"] = { -- Illusion
			["Description"] = "Ce personnage cache quelque chose sous une toile illusoire, ceux qui y sont sensibles sentiront que quelque chose cloche.",
			["Icone"] = "INV_Inscription_TarotIllusion",
			["Nom"] = "Illusion",
			["Createur"] = "Céralynde",
			["EtatCat"] = 10,
			["Type"] = 2,
		},
		
		-- Apparence : 00901 à 01000
		["AUR00503"] = { -- Fatigue
			["Description"] = "Ce personnage est fatigué. Il n'a apparemment pas dormi depuis longtemps.",
			["Icone"] = "Spell_Nature_Sleep",
			["Nom"] = "Fatigue",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 11,
		},
		["AUR00901"] = { -- Sourire éclatant
			["Description"] = "Cette personne a visiblement une excellente hygiène buccale. Son sourire est éclatant !",
			["Icone"] = "Achievement_Halloween_Smiley_01",
			["Nom"] = "Sourire éclatant",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 11,
			["Type"] = 3,
		},
		["AUR00902"] = { -- Silhouette musclée
			["Description"] = "Ce personnage fait de la gonflette, et cela se voit !",
			["Icone"] = "Spell_Nature_Strength",
			["Nom"] = "Silhouette musclée",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 11,
			["Type"] = 3,
		},
		["AUR00903"] = { -- Soin de l'apparence
			["Description"] = "Ce personnage attache visiblement beaucoup d'importance à son apparence.",
			["Icone"] = "Achievement_BG_most_damage_killingblow_dieleast",
			["Nom"] = "Soin de l'apparence",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 11,
			["Type"] = 3,
		},
		["AUR00904"] = { -- Peinture de guerre
			["Description"] = "Ce personnage porte des peintures de guerre sur le visage.",
			["Icone"] = "ability_rogue_preparation",
			["Nom"] = "Peintures de guerre",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 11,
			["Type"] = 2,
		},
		["AUR00905"] = { -- Trempé
			["Description"] = "Ce personnage est trempé.",
			["Icone"] = "inv_misc_volatilewater",
			["Nom"] = "Trempé jusqu'aux os",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 11,
			["Type"] = 2,
		},
		["AUR00906"] = { -- Richesse
			["Createur"] = "Telkostrasz",
			["Description"] = "Vêtements de qualité, bourse bien remplie ... Tout indique que ce personnage n'a aucun soucis financier, bien au contraire !",
			["Icone"] = "ACHIEVEMENT_GUILDPERK_CASHFLOW_RANK2",
			["Nom"] = "Richesse",
			["EtatCat"] = 11,
		},
		["AUR00907"] = { -- Pauvreté
			["Createur"] = "Telkostrasz",
			["Description"] = "Vêtements sales et troués, estomac qui gronde ... Tout indique que ce personnage est sans le sou.",
			["Icone"] = "INV_Misc_Pelt_Bear_Ruin_05",
			["Nom"] = "Pauvreté",
			["EtatCat"] = 11,
		},
		["AUR00908"] = { -- Pupille dilatée
			["Description"] = "Ce personnage a les pupilles dilatées.",
			["Icone"] = "Ability_Hunter_BeastWithin",
			["Nom"] = "Mydriase",
			["Createur"] = "Damön",
			["EtatCat"] = 11,
			["Type"] = 1,
		},
		-- Aura 01001 à 01100
		["AUR01001"] = { -- Confiance
			["Description"] = "Cette personne dégage une aura inspirant la confiance.",
			["Icone"] = "Spell_Holy_AuraMastery",
			["Nom"] = "Confiance",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 14,
			["Type"] = 2,
		},
		["AUR01002"] = { -- Louche
			["Description"] = "Ce personne n'a pas l'air net. Il inspire la méfiance.",
			["Icone"] = "Ability_Rogue_WrongfullyAccused",
			["Nom"] = "Louche",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 14,
			["Type"] = 2,
		},
		
		-- Symptômes 01101 à 01200
		["AUR01101"] = { -- Paralysie
			["Description"] = "Cette personne est paralisée et est incapable de bouger. Ses muscles sont crispés et ne répondent plus.",
			["Icone"] = "Ability_Rogue_DeadenedNerves",
			["Nom"] = "Paralysie",
			["Createur"] = "Knilthas",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01102"] = { -- Engourdissement
			["Description"] = "Les membres de cette personne sont engourdis. Il a difficile à se mouvoir et son sens du toucher est affecté.",
			["Icone"] = "Spell_Frost_ManaRecharge",
			["Nom"] = "Engourdissements",
			["Createur"] = "Knilthas",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01103"] = { -- Affaiblissement
			["Description"] = "Ce personnage est affaiblit. Sa vivacité est diminuée, tout comme ses réflexes.",
			["Icone"] = "Spell_Shadow_ManaFeed",
			["Nom"] = "Affaiblissement",
			["Createur"] = "Knilthas",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01104"] = { -- Somnolence
			["Description"] = "La somnolence s'acharne sur ce personnage. Il a du mal à rester éveillé et concentré.",
			["Icone"] = "Spell_Nature_Polymorph",
			["Nom"] = "Somnolence",
			["Createur"] = "Knilthas",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01105"] = { -- Surdité
			["Description"] = "Ce personnage a perdu partiellement ses capacités auditives.",
			["Icone"] = "INV_Misc_Ear_Human_02",
			["Nom"] = "Surdité",
			["Createur"] = "Knilthas",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01106"] = { -- Cécité
			["Description"] = "Cette personne a partiellement (ou totalement) perdu la vue.",
			["Icone"] = "Spell_Arcane_Blink",
			["Nom"] = "Cécité",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01107"] = { -- Aphasie
			["Description"] = "Ce personnage a perdu l'usage de la parole.",
			["Icone"] = "Ability_Priest_Silence",
			["Nom"] = "Aphasie",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01108"] = { -- Nausée
			["Description"] = "Cette personne est parfois prise de vomissements.",
			["Icone"] = "Spell_Shadow_SoulLeech",
			["Nom"] = "Nausée",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01109"] = { -- Fièvre
			["Description"] = "Cette personne est fiévreuse.",
			["Icone"] = "Spell_Shadow_MindRot",
			["Nom"] = "Fièvre",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01110"] = { -- Toux faible
			["Description"] = "Cette personne tousse de temps en temps.",
			["Icone"] = "Ability_Rogue_MasterOfSubtlety",
			["Nom"] = "Faible toux",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR00507"] = { -- Migraine
			["Type"] = 1,
			["Description"] = "Ce personnage souffre d'une migraine abominable.",
			["Icone"] = "Spell_Arcane_MindMastery",
			["Nom"] = "Migraine",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 16,
		},
		["AUR00015"] = { -- Boiter
			["Type"] = 1,
			["Description"] = "Ce personnage boite et risque parfois de trébucher lors de ses déplacements.",
			["Icone"] = "Ability_Rogue_Trip",
			["Nom"] = "Boiteux",
			["Createur"] = "Telkostrasz",
			["OnUpdateCondi"] = "rand$<=$2;speed$>$0;ismount$~=$\"1\"",
			["OnUpdateEffet"] = "parole${randtext:trébuche+trébuche mais retrouve aussitôt son équilibre+trébuche et perd son équilibre+trébuche, perd son équilibre et s'étale lamentablement par terre}.$2;",
			["EtatCat"] = 16,
		},
		["AUR01111"] = { -- Amnésie partielle
			["Description"] = "Cette personne a actuellement perdu une partie de ses souvenirs.",
			["Icone"] = "Ability_Druid_Dreamstate",
			["Nom"] = "Amnésie passagère",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 16,
			["Type"] = 1,
		},
		["AUR01112"] = { -- Amnésie totale
			["Description"] = "Cette personne a perdu toute sa mémoire. Elle ne sait même plus qui elle est.",
			["Icone"] = "Ability_Druid_Dreamstate",
			["Nom"] = "Amnésie totale",
			["Createur"] = "Telkostrasz",
			["EtatCat"] = 16,
			["Type"] = 1,
		},

		----------------------
		-- Partagés par Lady Kara
		----------------------

		
 ["AUR04334"] = {
 ["EtatCat"] = 4,
 ["Type"] = 3,
 ["Description"] = "Le doux et reposant parfum du thé pandaren émane de ce personnage.",
 ["Icone"] = "INV_Drink_25_HoneyTea",
 ["Date"] = "10/11/12, 19:40:57 par Oruku",
 ["Nom"] = "Odeur de thé",
 ["VerNum"] = 2,
 ["Createur"] = "Oruku",
 },
 ["AUR04038"] = {
 ["EtatCat"] = 5,
 ["Type"] = 1,
 ["Description"] = "Ce personnage est mélancolique et son esprit est dévoré par ses sentiments négatifs.",
 ["Icone"] = "achievement_boss_devourerofsouls",
 ["Date"] = "20/10/13, 03:06:55 par Gueulelune",
 ["Nom"] = "Dévoré(e) par l'amertume",
 ["Createur"] = "Gueulelune",
 ["VerNum"] = 3,
 },
 ["AUR04572"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage a un totem accroché dans le dos. Il s'agit peut-être d'un chaman.",
 ["Icone"] = "Spell_Shaman_TotemRecall",
 ["Date"] = "07/01/13, 06:19:29 par Faraa",
 ["Nom"] = "Totem",
 ["VerNum"] = 2,
 },
 ["AUR04933"] = {
 ["EtatCat"] = 12,
 ["Type"] = 3,
 ["Description"] = "Ce personnage porte des distinctions militaires. Il est au moins un soldat reconnu de sa faction.",
 ["Icone"] = "ACHIEVEMENT_GUILDPERK_HONORABLEMENTION_RANK2",
 ["Date"] = "28/09/11, 14:34:50 par Galeb",
 ["Nom"] = "Distinctions",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04639"] = {
 ["EtatCat"] = 5,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage est un grunt de la Horde.",
 ["Icone"] = "INV_Shoulder_Leather_Horde_B_03",
 ["Date"] = "07/01/13, 06:22:58 par Faraa",
 ["Nom"] = "Grunt",
 ["VerNum"] = 2,
 },
 ["AUR04919"] = {
 ["EtatCat"] = 11,
 ["Type"] = 3,
 ["Description"] = "Ce personnage porte des vêtements en tissu de haute qualité!",
 ["Icone"] = "INV_Chest_Cloth_44",
 ["Date"] = "13/11/11, 01:41:58 par Gueulelune",
 ["Nom"] = "Tissu de haute qualité",
 ["VerNum"] = 2,
 ["Createur"] = "Gueulelune",
 },
 ["AUR04825"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Lightshope",
 ["Description"] = "Ce personnage a des rouleaux de bandages accroché à sa ceinture ou dans son sac..",
 ["Icone"] = "inv_misc_bandage_01",
 ["Date"] = "05/01/14, 02:07:40 par Lightshope",
 ["Nom"] = "Rouleaux de bandages",
 ["VerNum"] = 2,
 },
 ["AUR04543"] = {
 ["EtatCat"] = 10,
 ["Createur"] = "Arakara",
 ["Description"] = "En vous approchant de ce personnage, vous ressentez une forte attirance, et il ou elle prend l'apparence de ce qui vous attire.",
 ["Icone"] = "INV_ValentinesBoxOfChocolates02",
 ["Date"] = "30/12/12, 21:32:42 par Arakara",
 ["Nom"] = "Aura envoutante",
 ["VerNum"] = 2,
 },
 ["AUR04907"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte une sacoche pleine d'herbes et de plantes au niveau de la hanche.",
 ["Icone"] = "INV_Misc_Bag_HerbPouch",
 ["Date"] = "07/01/13, 06:39:13 par Faraa",
 ["Nom"] = "Sacoche d'herbes",
 ["VerNum"] = 3,
 },
 ["AUR04586"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Gueulelune",
 ["Description"] = "Ce personnage porte une sacoche à la ceinture. Si vous avez une affinité avec les esprits ou avec les Arcanes, vous pouvez sentir qu'il contient des éclats d'âmes.",
 ["Icone"] = "INV_Misc_Bag_Soulbag",
 ["Date"] = "19/07/12, 15:19:06 par Gueulelune",
 ["Nom"] = "Sacoche d'âmes",
 ["VerNum"] = 2,
 },
 ["AUR04094"] = {
 ["EtatCat"] = 4,
 ["Type"] = 1,
 ["Description"] = "Ce personnage empeste l'alcool. Yerk!",
 ["Icone"] = "INV_Drink_05",
 ["Date"] = "28/09/11, 14:44:04 par Galeb",
 ["Nom"] = "Odeur d'alcool",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04173"] = {
 ["EtatCat"] = 14,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte une rune de feu qui l'entoure d'une aura ardente.",
 ["Icone"] = "Spell_Fire_Rune",
 ["Date"] = "07/01/13, 06:15:30 par Faraa",
 ["Nom"] = "Rune de Feu",
 ["VerNum"] = 2,
 },
 ["AUR04436"] = {
 ["EtatCat"] = 9,
 ["Type"] = 1,
 ["Description"] = "L'âme de ce personnage est retenue par un autre, et doit ainsi obéir à des ordres qui ne sont pas les siens. Un tel sort ne peut pas être dissipé.",
 ["Icone"] = "ability_warlock_soulsiphon",
 ["Date"] = "30/12/12, 21:37:03 par Arakara",
 ["Nom"] = "Âme prisonnière",
 ["Createur"] = "Arakara",
 ["VerNum"] = 2,
 },
 ["AUR04375"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Galeb",
 ["Description"] = "Ce personnage porte des bandages.",
 ["Icone"] = "INV_Misc_Bandage_15",
 ["Date"] = "28/09/11, 15:07:15 par Galeb",
 ["Nom"] = "Couvert de bandages",
 ["VerNum"] = 3,
 },
 ["AUR04196"] = {
 ["EtatCat"] = 4,
 ["Createur"] = "Baboullinet",
 ["Description"] = "Ce personnage sent la poudre à canon. Il a dû manipuler des explosifs récemment.",
 ["Icone"] = "Ability_Vehicle_SiegeEngineCannon",
 ["Date"] = "28/09/11, 16:03:31 par Baboullinet",
 ["Nom"] = "Odeur de poudre à canon",
 ["VerNum"] = 3,
 },
 ["AUR04136"] = {
 ["EtatCat"] = 12,
 ["Type"] = 1,
 ["Description"] = "L'armure de ce personnage a apparemment du vécu. On peut y voir des marques de combats passés.",
 ["Icone"] = "Trade_Archaeology_GeneralBeauregardsLastStand",
 ["Date"] = "28/09/11, 15:15:54 par Galeb",
 ["Nom"] = "Armure abîmée",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04889"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Argalist",
 ["Description"] = "Ce personnage porte une sacoche pleine de parchemins. Il s'agit probablement d'un coursier ou d'un calligraphe.",
 ["Icone"] = "inv_misc_enchantedscroll",
 ["Date"] = "15/12/12, 05:09:39 par Argalist",
 ["Nom"] = "Rouleaux de parchemins",
 ["VerNum"] = 3,
 },
 ["AUR04320"] = {
 ["EtatCat"] = 12,
 ["Type"] = 3,
 ["Description"] = "L'armure et les armes de ce personnage portent de puissants enchantement. Impressionant!",
 ["Icone"] = "INV_Enchant_EssenceAstralLarge",
 ["Date"] = "28/09/11, 15:27:05 par Galeb",
 ["Nom"] = "Enchanté",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04417"] = {
 ["EtatCat"] = 11,
 ["Type"] = 3,
 ["Description"] = "Ce personnage est très réputé! Vous le connaissez sans doute déjà de nom.",
 ["Icone"] = "Achievement_Reputation_08",
 ["Date"] = "28/09/11, 14:36:55 par Galeb",
 ["Nom"] = "Réputé",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04305"] = {
 ["EtatCat"] = 11,
 ["Type"] = 3,
 ["Description"] = "Ce personnage est un druide accomplit! Des ramures de cerf poussent sur son front.",
 ["Icone"] = "TRADE_ARCHAEOLOGY_ANTLEREDCLOAKCLASP",
 ["Date"] = "28/09/11, 15:23:13 par Galeb",
 ["Nom"] = "Ramures de cerf",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04901"] = {
 ["Createur"] = "Balsey",
 ["Description"] = "Ce personnage fait parti de la Croisade écarlate.",
 ["Icone"] = "INV_Misc_Token_ScarletCrusade",
 ["Date"] = "05/03/12, 21:46:44 par Balsey",
 ["Nom"] = "Croisade écarlate",
 ["VerNum"] = 2,
 },
 ["AUR04205"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte un médaillon qui montre son appartenance au Clan Loup-de-Givre des montagnes d'Altérac.",
 ["Icone"] = "INV_Jewelry_FrostwolfTrinket_01",
 ["Date"] = "07/01/13, 06:36:35 par Faraa",
 ["Nom"] = "Clan Loup-de-Givre",
 ["VerNum"] = 2,
 },
 ["AUR04058"] = {
 ["EtatCat"] = 9,
 ["Createur"] = "Arakara",
 ["Description"] = "Ce personnage a vu son âme brisée et n'est à présent plus que l'ombre de lui-même.",
 ["Icone"] = "Ability_Warlock_ImprovedSoulLeech",
 ["Date"] = "30/12/12, 21:39:44 par Arakara",
 ["Nom"] = "Âme brisée",
 ["VerNum"] = 2,
 },
 ["AUR04911"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Galeb",
 ["Description"] = "Ce personnage porte des fioles à la ceinture. Sans doute un alchimiste ou un apothicaire.",
 ["Icone"] = "ACHIEVEMENT_GUILDPERK_CHUG A LUG_RANK2",
 ["Date"] = "28/09/11, 14:33:39 par Galeb",
 ["Nom"] = "Chimiste",
 ["VerNum"] = 2,
 },
 ["AUR04156"] = {
 ["EtatCat"] = 5,
 ["Createur"] = "Valmadra",
 ["Description"] = "Ce personnage, probablement un druide ou une druidesse, est capable de passer d'une forme à une autre.",
 ["Icone"] = "spell_druid_wildcharge",
 ["Date"] = "15/11/13, 23:31:40 par Valmadra",
 ["Nom"] = "Changeforme",
 ["VerNum"] = 2,
 },
 ["AUR04363"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Gueulelune",
 ["Description"] = "Ce personnage porte un médaillon des Réprouvés... comme trophée ou comme preuve d'allégeance?",
 ["Icone"] = "Inv_Misc_Tournaments_Symbol_Scourge",
 ["Date"] = "05/01/13, 21:23:27 par Gueulelune",
 ["Nom"] = "Médaillon Réprouvé",
 ["VerNum"] = 4,
 },
 ["AUR04662"] = {
 ["EtatCat"] = 11,
 ["Createur"] = "Baboullinet",
 ["Description"] = "Ce personnage transpire en abondance.",
 ["Icone"] = "Spell_Nature_FocusedMind",
 ["Date"] = "28/09/11, 16:20:52 par Baboullinet",
 ["Nom"] = "En sueur",
 ["VerNum"] = 2,
 },
 ["AUR04168"] = {
 ["EtatCat"] = 11,
 ["Type"] = 3,
 ["Description"] = "Ce personnage porte des bijoux. Magnifique!",
 ["Icone"] = "inv_jewelry_necklace_110",
 ["Date"] = "15/11/13, 23:36:45 par Valmadra",
 ["Nom"] = "Bijoux",
 ["VerNum"] = 2,
 ["Createur"] = "Valmadra",
 },
 ["AUR04158"] = {
 ["EtatCat"] = 14,
 ["Type"] = 3,
 ["Description"] = "Si vous avez une affinité avec les éléments, vous pouvez sentir que ce personnage est très proche des éléments.",
 ["Icone"] = "spell_Shaman_convection",
 ["Date"] = "28/09/11, 14:27:27 par Galeb",
 ["Nom"] = "Aura élémentaire",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04162"] = {
 ["EtatCat"] = 14,
 ["Type"] = 3,
 ["Description"] = "Une puissante aura arcanique émane de ce personnage.",
 ["Icone"] = "Spell_Arcane_FocusedPower",
 ["Date"] = "06/03/11, 20:39:06 par Norah",
 ["Nom"] = "Aura des arcanes",
 ["Createur"] = "Norah",
 ["VerNum"] = 3,
 },
 ["AUR04720"] = {
 ["EtatCat"] = 14,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte une rune des Arcanes qui l'entoure d'une aura magique.",
 ["Icone"] = "Spell_Arcane_Rune",
 ["Date"] = "07/01/13, 06:16:37 par Faraa",
 ["Nom"] = "Rune des Arcanes",
 ["VerNum"] = 2,
 },
 ["AUR04438"] = {
 ["EtatCat"] = 5,
 ["Createur"] = "Faraa",
 ["Description"] = "Cet animal est dressé pour le combat, pour servir d'animal de compagnie ou de monture.",
 ["Icone"] = "Ability_Hunter_BeastTaming",
 ["Date"] = "08/01/13, 04:14:38 par Faraa",
 ["Nom"] = "Dressé",
 ["VerNum"] = 2,
 },
 ["AUR04604"] = {
 ["EtatCat"] = 11,
 ["Createur"] = "Abittbol",
 ["Description"] = "Ce personnage est taché de sang.",
 ["Icone"] = "Ability_Warrior_BloodFrenzy",
 ["Date"] = "09/03/12, 18:31:43 par Abittbol",
 ["Nom"] = "Taches de sang",
 ["VerNum"] = 2,
 },
 ["AUR04291"] = {
 ["EtatCat"] = 5,
 ["Createur"] = "Galeb",
 ["Description"] = "Ce personnage rigole pour un rien!",
 ["Icone"] = "INV_Misc_Ticket_Tarot_Lunacy",
 ["Date"] = "28/09/11, 15:28:44 par Galeb",
 ["Nom"] = "Humour facile",
 ["VerNum"] = 2,
 },
 ["AUR04492"] = {
 ["EtatCat"] = 14,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte une Rune de Nature qui l'entoure d'une aura sauvage.",
 ["Icone"] = "Spell_Nature_Rune",
 ["Date"] = "07/01/13, 06:15:00 par Faraa",
 ["Nom"] = "Rune de Nature",
 ["VerNum"] = 3,
 },
 ["AUR04245"] = {
 ["EtatCat"] = 4,
 ["Type"] = 3,
 ["Description"] = "Ce personnage est impregné de l'odeur du bon houblon, comme une bière faite avec passion! Ça peut donner envie de faire un tour à l'auberge du coin!",
 ["Icone"] = "INV_Drink_16",
 ["Date"] = "10/11/12, 19:44:41 par Oruku",
 ["Nom"] = "Bonne odeur de bière",
 ["VerNum"] = 4,
 ["Createur"] = "Oruku",
 },
 ["AUR04353"] = {
 ["EtatCat"] = 14,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte une rune de givre qui l'entoure d'une aura glaciale.",
 ["Icone"] = "Spell_Ice_Rune",
 ["Date"] = "07/01/13, 06:14:56 par Faraa",
 ["Nom"] = "Rune de Givre",
 ["VerNum"] = 4,
 },
 ["AUR04619"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Gueulelune",
 ["Description"] = "Ce personnage porte un grimoire occulte. Peut-être est-il connaisseur des arts interdits de la Nécromancie ou de la Démonologie?",
 ["Icone"] = "ability_warlock_ancientgrimoire",
 ["Date"] = "19/07/12, 12:53:05 par Gueulelune",
 ["Nom"] = "Grimoire sombre",
 ["VerNum"] = 2,
 },
 ["AUR04312"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Galeb",
 ["Description"] = "Ce personnage porte des bandages couverts de tâches de sang.",
 ["Icone"] = "INV_Misc_Bandage_08",
 ["Date"] = "28/09/11, 15:07:51 par Galeb",
 ["Nom"] = "Couvert de bandages sanglants",
 ["VerNum"] = 2,
 },
 ["AUR04942"] = {
 ["EtatCat"] = 11,
 ["Type"] = 3,
 ["Description"] = "Ce personnage porte des vêtements en cuir de haute qualité!",
 ["Icone"] = "Trade_Archaeology_Decorated Leather Boot Heel",
 ["Date"] = "12/11/11, 22:37:08 par Galeb",
 ["Nom"] = "Cuir de haute qualité",
 ["VerNum"] = 4,
 ["Createur"] = "Galeb",
 },
 ["AUR04803"] = {
 ["EtatCat"] = 11,
 ["Type"] = 1,
 ["Description"] = "Ce personnage est couvert d'ichor dégoûtant et puant. Beuarh!",
 ["Icone"] = "Spell_DeathKnight_Explode_Ghoul",
 ["Date"] = "28/09/11, 14:31:18 par Galeb",
 ["Nom"] = "Couvert d'ichor",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04577"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Gueulelune",
 ["Description"] = "Ce personnage porte un grimoire de de sorcier. Peut-être est-il connaisseur des arts des Arcanes?",
 ["Icone"] = "INV_Misc_Book_16",
 ["Date"] = "19/07/12, 12:50:42 par Gueulelune",
 ["Nom"] = "Grimoire des arcanes",
 ["VerNum"] = 2,
 },
 ["AUR04322"] = {
 ["EtatCat"] = 14,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte une rune d'ombre qui l'entoure d'une aura ténèbreuse.",
 ["Icone"] = "Spell_Shadow_Rune",
 ["Date"] = "07/01/13, 06:15:59 par Faraa",
 ["Nom"] = "Rune d'Ombre",
 ["VerNum"] = 2,
 },
 ["AUR04677"] = {
 ["EtatCat"] = 4,
 ["Type"] = 1,
 ["Description"] = "Ce personnage empeste l'odeur du vomi. Bwerk!",
 ["Icone"] = "Ability_Creature_Poison_06",
 ["Date"] = "28/09/11, 14:52:21 par Galeb",
 ["Nom"] = "Odeur de gerbe",
 ["VerNum"] = 2,
 ["Createur"] = "Galeb",
 },
 ["AUR04497"] = {
 ["EtatCat"] = 3,
 ["Createur"] = "Galeb",
 ["Description"] = "Ce personnage est en patrouille et maintient l'ordre dans les environs.",
 ["Icone"] = "Spell_Holy_Heroism",
 ["Date"] = "15/07/12, 20:01:37 par Galeb",
 ["Nom"] = "En patrouille",
 ["VerNum"] = 2,
 },
 ["AUR04600"] = {
 ["EtatCat"] = 10,
 ["Createur"] = "Arakara",
 ["Description"] = "Ce personnage est un démon, ou a volé les pouvoirs d'un démon.",
 ["Icone"] = "Ability_Warlock_DemonicPower",
 ["Date"] = "30/12/12, 21:47:41 par Arakara",
 ["Nom"] = "Démoniaque",
 ["VerNum"] = 2,
 },
 ["AUR04067"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Galeb",
 ["Description"] = "Ce personnage porte à la ceinture un marteau de forgeron, un petit sac de clous et d'autres objets utiles à un artisan.",
 ["Icone"] = "Ability_Repair",
 ["Date"] = "28/09/11, 15:00:00 par Galeb",
 ["Nom"] = "Artisan",
 ["VerNum"] = 2,
 },
 ["AUR04322"] = {
 ["EtatCat"] = 11,
 ["Type"] = 3,
 ["Description"] = "Ce personnage porte une magnifique armure étincelante!",
 ["Icone"] = "INV_Chest_Plate03",
 ["Date"] = "12/11/11, 22:41:44 par Galeb",
 ["Nom"] = "Armure étincelante",
 ["VerNum"] = 3,
 ["Createur"] = "Galeb",
 },
 ["AUR04939"] = {
 ["EtatCat"] = 14,
 ["Type"] = 3,
 ["Description"] = "En étant aux cotés de ce personnage, vous sentez une aura qui vous pousse à donner le meilleur de vous-même. Ce personnage est tellement classe, c'est inspirant!",
 ["Icone"] = "ACHIEVEMENT_GUILDPERK_MRPOPULARITY_RANK2",
 ["Date"] = "06/03/12, 12:31:43 par Abittbol",
 ["Nom"] = "Aura : grande classe",
 ["VerNum"] = 2,
 ["Createur"] = "Abittbol",
 },
 ["AUR04422"] = {
 ["EtatCat"] = 14,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte une rune du sacré qui l'entoure d'une aura de lumière.",
 ["Icone"] = "Spell_Holy_Rune",
 ["Date"] = "07/01/13, 06:14:42 par Faraa",
 ["Nom"] = "Rune du Sacré",
 ["VerNum"] = 2,
 },
 ["AUR04106"] = {
 ["EtatCat"] = 10,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage est entouré d'une rune de clairvoyance qui lui permet de détecter les invisibilités magiques.",
 ["Icone"] = "INV_Misc_Rune_03",
 ["Date"] = "07/01/13, 06:17:53 par Faraa",
 ["Nom"] = "Rune de Clairvoyance",
 ["VerNum"] = 3,
 },
 ["AUR04086"] = {
 ["EtatCat"] = 12,
 ["Createur"] = "Faraa",
 ["Description"] = "Ce personnage porte une fourrure animale sur lui. Est-ce une peau d'ours, de loup... ou autre chose?",
 ["Icone"] = "INV_Misc_Pelt_10",
 ["Date"] = "07/01/13, 06:48:20 par Faraa",
 ["Nom"] = "Fourrure",
 ["VerNum"] = 2,
 },

		
		-----------------------
		-- Quetes : 00101 à 00500
		-----------------------
		-- Quête : Traitresse ! Horde --
		["AUR00101"] = { -- Distraction de Gryshka
			["Description"] = "Ce personnage a distrait Gryshka. Il peut en profiter pour lui dérober un objet !",
			["OnLifeTimeCondi"] = "queststep(QUE00003)$==$\"006\";",
			["Nom"] = "Distraction : Gryshka",
			["EtatCat"] = 3,
			["bAjout"] = false,
			["OnLifeTimeEffet"] = "quest$QUE00003$005$1;",
			["Createur"] = "Telkostrasz",
			["Icone"] = "Achievement_Character_Orc_Female",
			["OnReceiveEffet"] = "texte$Gryshka est distraite  !\nProfitez en pour la fouiller !$3;",
		},
		-- Quête : Traitresse ! Alliance --
		["AUR00102"] = { -- Distraction de Erika
			["Description"] = "Ce personnage a distrait Erika. Il peut en profiter pour lui dérober un objet !",
			["OnLifeTimeCondi"] = "queststep(QUE00002)$==$\"006\";",
			["Nom"] = "Distraction : Erika",
			["bAjout"] = false,
			["EtatCat"] = 3,
			["OnLifeTimeEffet"] = "quest$QUE00002$005$1;",
			["Createur"] = "Telkostrasz",
			["Icone"] = "Achievement_Character_Human_Female",
			["OnReceiveEffet"] = "texte$Erika est distraite  !\nProfitez en pour la fouiller !$3;",
		},
	}
	
local pairs, tinsert = pairs, tinsert;
local iconPrefix = "Interface\\Icons\\"

local cleanTable = {}

function Brikabrok.cleanTable()
   for _, clin in pairs(brikabrokGlances) do
		 if clin["Icone"] ~= nil and clin["Nom"] ~= nil then
			tinsert(cleanTable, { iconTexture = iconPrefix..clin["Icone"], name = clin["Nom"]:lower(), contentSTR = clin["Description"]});
		 end
   end
end

Brikabrok.cleanTable()
	
function Brikabrok.getGlancesList(filter)
   -- No filter or bad filter
   if filter == nil or filter:len() == 0 then
      return cleanTable;
   end
   filter = filter:lower();
   local newList = {};
   for _, clin in pairs(brikabrokGlances) do
      if Brikabrok.safeMatch(clin["Nom"]:lower(), filter) then
         tinsert(newList, { iconTexture = iconPrefix..clin["Icone"], name = clin["Nom"], contentSTR = clin["Description"]}) 
      end
   end
   return newList;
end
-- thx trp3
local ID_CHARS = {};
for i=48, 57 do
	tinsert(ID_CHARS, string.char(i));
end
for i=65, 90 do
	tinsert(ID_CHARS, string.char(i));
end
for i=97, 122 do
	tinsert(ID_CHARS, string.char(i));
end
local sID_CHARS = #ID_CHARS;

function Brikabrok.generateID()
	local ID = date("%m%d%H%M%S");
	for i=1, 5 do
		ID = ID .. ID_CHARS[math.random(1, sID_CHARS)];
	end
	return ID;
end

function Brikabrok:ShowGlancesFrame(dataType)

	local buildTable  = {}

	local iconBrowserFrame = StdUi:Window(nil, 800, 600, "Brikabrok : Coup d'oeil");
	iconBrowserFrame:SetPoint('CENTER');

	local searchBox = StdUi:SearchEditBox(iconBrowserFrame, 400, 30, 'Écrivez le mot clé ici');
	searchBox:SetFontSize(16);
	searchBox:SetScript('OnEnterPressed', function()
	      local input = searchBox:GetText()
	      buildTable = self.getGlancesList(input)
	      iconBrowserFrame.searchResults:SetData(buildTable, true);
	end);
	StdUi:GlueTop(searchBox, iconBrowserFrame, 20, -50, 'LEFT');


	local searchButton = StdUi:Button(iconBrowserFrame, 80, 30, 'Chercher');
	searchButton:SetScript("OnClick", function()
	      local input = searchBox:GetText()
	      buildTable = Brikabrok.getIconList(input)
	      iconBrowserFrame.searchResults:SetData(buildTable, true);
	end)
	StdUi:GlueRight(searchButton, searchBox, 5, 0);



	local addFavoritesButton = StdUi:Button(iconBrowserFrame, 30, 30, '');
	addFavoritesButton.texture = StdUi:Texture(addFavoritesButton, 17, 17, [[Interface\Common\ReputationStar]]);
	addFavoritesButton.texture:SetPoint('CENTER');
	addFavoritesButton.texture:SetBlendMode('ADD');
	addFavoritesButton.texture:SetTexCoord(0, 0.5, 0, 0.5);
	StdUi:GlueRight(addFavoritesButton, searchButton, 5, 0);

	local cols = {
	   {
	      name         = '',
	      width        = 48,
	      align        = 'LEFT',
	      index        = 'iconTexture',
	      format       = 'icon',
	      sortable     = false,
	   },
	   {
	      name         = 'Nom',
	      width        = 250,
	      align        = 'LEFT',
	      index        = 'name',
	      format       = 'string',
	   },
	   {
	      name         = 'Description',
	      width        = 400,
	      align        = 'LEFT',
	      index        = 'contentSTR',
	      format       = 'string',
	   },
	}


	iconBrowserFrame.searchResults = StdUi:ScrollTable(iconBrowserFrame, cols, 8, 50);
	iconBrowserFrame.searchResults:EnableSelection(true);
	StdUi:GlueBelow(iconBrowserFrame.searchResults, searchBox, 0, - 40, 'LEFT') ;

	local selectionButton = StdUi:Button(iconBrowserFrame, 100, 30, 'Apprendre');
	selectionButton:SetScript("OnClick", function()
	      local index = iconBrowserFrame.searchResults:GetSelection()
	      local iconData = iconBrowserFrame.searchResults:GetRow(index)
		  local presetID = Brikabrok.generateID();
		  --local glance = {}
		  --glance.TI = iconData.name
		  --glance.TX = iconData.contentSTR
		  --glance.IC = string.gsub(iconData.iconTexture, iconPrefix, "")
		  --TRP3_API.register.glance.saveSlotPreset(glance)
		  TRP3_Presets.peek[presetID] = {}
		  TRP3_Presets.peek[presetID].icon = string.gsub(iconData.iconTexture, iconPrefix, "")
		  TRP3_Presets.peek[presetID].title = iconData.name
		  TRP3_Presets.peek[presetID].text = iconData.contentSTR
		  if not TRP3_Presets.peekCategory["Brikabrok"] then
			TRP3_Presets.peekCategory["Brikabrok"] = {};
		  end
		  tinsert(TRP3_Presets.peekCategory["Brikabrok"], presetID);
	end)
	StdUi:GlueBelow(selectionButton, iconBrowserFrame.searchResults, 10, -15,"CENTER");
	Brikabrok.getGlancesList("")
end

function Brikabrok:commandGlances(input)
	Brikabrok:ShowGlancesFrame("meme")
end
