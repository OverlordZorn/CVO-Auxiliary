/* WIP
 * Author: Zorn
 * Plays random music from premade playlists
 *
 * Arguments:
 * 0: premade playlist <string>
 * Return Value:
 * None
 *
 * Example:
 * ["postInit"] call cvo_music_fnc_music;
 * ["leave_Base"] call cvo_music_fnc_music;
 *
 * Public: i guess so?
*/


params [	["_playlist", "", [""]]		];


if (_playlist == "") exitWith {diag_log "[CVO] [MUSIC] - no playlist defined"};

if (_playlist isEqualTo "postInit") exitWith {

	// ############################################################
	// ###### Add CBA Event
	// ############################################################

	["CVO_CBAEvent_Music_StoppedNext", {
		// Deletes JIP ID
		remoteExec ["", "CVO_Music_JIP_playMusic"];
		CVO_Music_isPlaying = false;
		// Define Delay and Execute "NEXT" on the server with cba_fnc_waitAndExecute
		private _delay = CVO_CBA_musicDelayMin + (ceil random CVO_CBA_musicDelayRandom);
		diag_log format ["[CVO][Music](CBAEvent)(Next) Delay until Next Song: %1 -- Music Queue: %2", _delay, CVO_Music_Queue];
		[{	["NEXT"] call cvo_music_fnc_play;	}, [], _delay ] call CBA_fnc_waitAndExecute;	
	}] call CBA_fnc_addEventHandler;



	if (isServer) then {CVO_Music_Queue = []; CVO_Music_isPlaying = false;};

	// ############################################################
	// ###### Adds CLIENT Music Event Handler
	// ############################################################

	if (hasInterface) then {

		

		addMusicEventHandler ["MusicStart", { 
			params ["_musicClassname", "_ehId"];

			_path = (configFile >> "CfgMusic" >> _musicClassname);
			_name = [_path,"name", "Not Found"] call BIS_fnc_returnConfigEntry;

			_str = switch (missionNamespace getVariable ["CVO_CBA_MusicDisplayString", "NAME"]) do {
				case "NAME": { _name };
				default { _musicClassname };
			};

			diag_log format ["[CVO][Music](Started) %1 ## classname: %2", _name, _musicClassname];
			if (CVO_CBA_musicDisplay) 										then {	systemChat format ["[CVO][Music] Now Playing: %1", _str];	};
			if (CVO_CBA_musicDisplayLow && getAudioOptionVolumes#1 < 0.05) 	then {	systemChat format ["[CVO][Music] Your Music Volume is low @ %1%2", floor((getAudioOptionVolumes#1)*1000)/10,"%"];	}; 
		}];

		addMusicEventHandler ["MusicStop", { 
			params ["_musicClassname", "_ehId"];
			diag_log format ["[CVO][Music](Stopped) %1", _musicClassname];

			// Only the client with the oldest Steam64ID will execute the CBA Event to avoid multiple executions
			private _array = call BIS_fnc_listPlayers apply { getPlayerUID _x };
			_array sort true;
			diag_log format ["[CVO][Music](Stopped) _array:    %1", _array];
			diag_log format ["[CVO][Music](Stopped) PlayerUID: %1", getPlayerUID player];
			if (getPlayerUID player == _array select 0) then {
				["CVO_CBAEvent_Music_StoppedNext"] call CBA_fnc_serverEvent;
				diag_log format ["[CVO][Music](Stopped) Making the Call: %1", true];
			} else {
				diag_log format ["[CVO][Music](Stopped) Making the Call: %1", false];
			};
		}];
	};

	// ############################################################
	// ###### Adds Zeus Interaction Nodes
	// ############################################################

	// ############################################################
	// ###### Adds Zeus Parent Node
		_action = [
			"cvo_music_zeus_node",
			"CVO Music",
			"z\cvo_aux\addons\others\img\Raven_Voron_256.paa",
			{},
			{true}
			] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

	// ###### FadeStop
		_action = ["cvo_music_zeus_fadeFade","FadeStop Next","\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
		{	"fadeStop" remoteExecCall ["cvo_music_fnc_play", 2];	},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node"], _action] call ace_interact_menu_fnc_addActionToZeus;

		_action = ["cvo_music_zeus_fadeFadeClear","FadeStop Clear","\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
		{	"fadeStopClear" remoteExecCall ["cvo_music_fnc_play", 2];	},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node"], _action] call ace_interact_menu_fnc_addActionToZeus;

	// ############################################################
	// ###### Adds Zeus Playlist Node
		_action = ["cvo_music_zeus_playlists","Playlists","\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node"], _action] call ace_interact_menu_fnc_addActionToZeus;

	// ###### Playlists
		_action = ["cvo_music_zeus_pl_leaveBase","Leave Base","\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa",{["leave_Base"] call CVO_Music_fnc_playlist},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;

		_action = ["cvo_music_zeus_pl_tense","Tense","\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa",{["tense"] call CVO_Music_fnc_playlist},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;

		_action = ["cvo_music_zeus_pl_ChorniVoron","Chorni Voron","\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa",{["ChorniVoron"] call CVO_Music_fnc_playlist},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;

		if (configName (configFile >> "CfgMusic" >> "AmbientTrack01_lxWS") != "") then {

			_action = ["cvo_music_zeus_pl_WS_Ambient","WS Ambient","\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa",{["WS_Ambient"] call CVO_Music_fnc_playlist},{true}] call ace_interact_menu_fnc_createAction;
			[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;


		};

	diag_log ("[CVO][MUSIC] - Zeus Actions Established");
};


// Playlist Function starts here when param is not "postInit"

diag_log format ["[CVO][MUSIC](playlist selected) %1", _playlist];
private _selection = switch (_playlist) do {
	case "leave_Base": {
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
	};
	case "tense": {
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
	};

	case "WS_Ambient": {
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
	};

	case "ChorniVoron": {
		[ "cvo_chorniVoron" ]
	};
}; 

_selection = _selection select { configName (configFile >> "CfgMusic" >> _x) != "" };

private _song = _selection call BIS_fnc_selectRandom;

systemChat format ["[CVO][MUSIC](Playlist) %1 - Song: %2", _playlist, _song];

_song remoteExecCall ["cvo_music_fnc_play", 2]; 
