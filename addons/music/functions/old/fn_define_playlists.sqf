#include "../script_component.hpp"

/*
* Author: Zorn
* This function will define the preMade playlists and establish the initial Hashmap
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

[
    "Chorni Voron",
    [
        "cvo_chorniVoron"
    ]
] call FUNC(add_playlist);

[
    "Leave Base",
    [	
        "cvo_music_chorniVoron",
        "AmbientTrack01_F",
        "AmbientTrack01a_F",
        "AmbientTrack01b_F",
        "AmbientTrack03_F",
        "AmbientTrack04_F",
        "LeadTrack02a_F_EPB",
        "LeadTrack03a_F_EPB",
        "EventTrack01_F_EPB",
        "EventTrack01a_F_EPB",
        "EventTrack04_F_EPB",
        "EventTrack04a_F_EPB",
        "AmbientTrack01_F_EPB",
        "BackgroundTrack01_F_EPB",
        "LeadTrack01_F_EPC",
        "LeadTrack06_F_EPC",
        "LeadTrack06b_F_EPC",
        "EventTrack01_F_EPC",
        "BackgroundTrack01_F_EPC",
        "BackgroundTrack02_F_EPC",
        "BackgroundTrack03_F_EPC",
        "BackgroundTrack04_F_EPC",
        "MAD",
        "SkyNet",
        "Wasteland",
        "Defcon",
        "Fallout",
        "LeadTrack02_F_Jets",
        "LeadTrack01_F_Orange",
        "AmbientTrack02_F_Orange",
        "AmbientTrack01_F_Orange",
        "AmbientTrack01_F_EXP",
        "AmbientTrack01a_F_EXP",
        "LeadTrack01_F_Tacops",  
        "LeadTrack02_F_Tacops",
        "LeadTrack03_F_Tacops",
        //western sahara
        "LeadTrack01_lxWS",
        //reaction forces
        "OST_01_RF",
        "OST_03_RF",
        "OST_06_RF",
        "OST_07_RF",
        "OST_09_RF"
    ]
] call FUNC(add_playlist);

[
    "Tense",
    [
        "cvo_RocketTrain",
        "Track11_StageB_stealth",
        "AmbientTrack01b_F",
        "AmbientTrack01a_F",
        "AmbientTrack01_F",
        "Track_O_16",
        "Track_P_03",
        "Track_P_04",
        "Track_P_05",
        "OM_Music02",
        "OM_Music03",
        "Track_O_14",
        "Track_O_13",
        "Track_O_07",	
        "Track_O_05",
        "Track_C_20",
        "Track_C_18",
        "Track_C_15",
        "Track_C_14",
        "Track_C_09",
        "Track_C_08",
        "Track_C_07",
        "Track_C_02",
        "Track_C_01",
        "Music_Freeroam_End",
        "Music_FreeRoam_Battle_Human_Loop",
        "Music_FreeRoam_Battle_Human",
        "Music_FreeRoam_Battle_Alien",
        "Music_FreeRoam_Russian_Theme",
        "Music_FreeRoam_Russian_Theme_Loop",
        "Music_FreeRoam_Tension_Loop_01",
        "Music_FreeRoam_Suspended_Loop_01",
        "Music_Freeroam_RootExtract",
        "Music_Hostile_Drone_Close_01",
        "Music_Roaming_Day_02",
        "Music_Roaming_Day",
        "Music_Roaming_Night_02",
        "Music_Roaming_Night",
        "Music_Probe_Discovered",
        "Music_Credits_Contact",
        "Music_Menu_Contact",
        "AmbientTrack01_F_Tank",
        "AmbientTrack04b_F_Tacops",
        "AmbientTrack04a_F_Tacops",
        "AmbientTrack03b_F_Tacops",
        "AmbientTrack03a_F_Tacops",
        "AmbientTrack02b_F_Tacops",
        "AmbientTrack02a_F_Tacops",
        "AmbientTrack01b_F_Tacops",
        "AmbientTrack01a_F_Tacops",
        //western sahara
        "jukebox_e1_lxWS",
        "jukebox_e2_lxWS",
        "jukebox_e3_lxWS",
        "jukebox_t4a_lxWS",
        "jukebox_t2_lxWS",
        "jukebox_t3_lxWS",
        "jukebox_t3a_lxWS",
        "jukebox_t3b_lxWS",
        "jukebox_t4a_lxWS",
        "jukebox_t4b_lxWS",
        "jukebox_t4c_lxWS",
        "jukebox_t5a_lxWS",
        "jukebox_t5b_lxWS",
        "alchemist_action1_lxWS",
        "alchemist_action2_lxWS",
        "alchemist_action3_lxWS",
        "alchemist_action4_lxWS",
        //reaction forces
        "OST_02_RF",
        "OST_04_RF",
        "OST_05_RF",
        "OST_08_RF",
        "AmbientTrack01_RF",
        "AmbientTrack02a_RF",
        "AmbientTrack02b_RF",
        "AmbientTrack02c_RF"
    ]
] call FUNC(add_playlist);

[
    "WS Ambient",
    [
        "AmbientTrack01_lxWS",
        "AmbientTrack03a_lxWS",
        "AmbientTrack03b_lxWS",
        "AmbientTrack03c_lxWS",
        "AmbientTrack04_lxWS",
        "jukebox_a1_lxWS",
        "jukebox_a2_lxWS",
        "jukebox_b1_lxWS",
        "jukebox_b2_lxWS",
        "jukebox_b3_lxWS",
        "jukebox_c1_lxWS",
        "jukebox_c2_lxWS",
        "jukebox_d1_lxWS",
        "jukebox_d2_lxWS",
        "jukebox_d3_lxWS",
        "jukebox_d4_lxWS",
        "jukebox_d5_lxWS",
        "alchemist_01v2_lxWS",
        "alchemist_02v2_lxWS"
    ]
] call FUNC(add_playlist);

[	
    "Desiderii Marginis",
    [
        "BlackLight_WhenLIfeShoneWarm",
        "BlackLight_Twilight",
        "BlackLight_TheShadowIsOne",
        "BlackLight_TearsOfWax",
        "BlackLight_Ghostfires",
        "BlackLight_AnInnerWilderness",

        "Procession_SilentMessenger",
        "Procession_Procession",
        "Procession_ComeRuindAndRapture",
        "Procession_Adrift"
    ]
] call FUNC(add_playlist);

[
    "Saharan Cellphone Music",
    [
        "Tinariwen_TenereTaqqal",
        "Tinariwen_Sastanaqqam",
        "Tinariwen_Nannuflay",
        "Tinariwen_GroupAnmataff",
        "EtrandeLAir_TouboukIneChihoussay",
        "EtrandeLAir_Erkazamane",
        "Amanar_Alghafiat"
    ]
] call FUNC(add_playlist);

[
    "Desert Ambient",
    [
        "RedDesertSky",
        "ReplacementSky",
        "StreetsOfTangier",
        "Karunesh_Caravanserai",
        "Desert_Lands",
        "Nissim_TheGaslampKiller"
    ]
] call FUNC(add_playlist);

[
    "Eerie Ambient",
    [
        "Apoptose_Nidstang",
        "MonasteriumImperi_PaxImperatoris",
        "Phragments_TheFogsHaveRisen",
        "Odinn",
        "BlackTears"
    ]
] call FUNC(add_playlist);