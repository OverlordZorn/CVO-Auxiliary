/* WIP
 * Author: Zorn
 * Plays music if the queue is empty, if not, it will be put the track into the queue
 *
 * Arguments:
 * 0: classname of music
 * 1: Name of queue Variable
 *
 * Return Value:
 * None
 *
 * Example:
 * ["NEXT"] call cvo_music_fnc_play;
 * ["cvo_music_"] call cvo_music_fnc_play;
 *
 * Public: i guess so?
*/


params [	
	["_song", "", [""]]
];

if (!isServer) exitWith {	_this remoteExec ["cvo_music_fnc_play", 2]	};

if (_song == "fadeStop") exitWith {
	if (!CVO_Music_isPLaying) exitWith {};
	[10] remoteExecCall ["cvo_music_fnc_fadeStop"];
};
if (_song == "fadeStopClear") exitWith {
	CVO_Music_Queue = [];
	if (!CVO_Music_isPLaying) exitWith {};
	[10] remoteExecCall ["cvo_music_fnc_fadeStop"];
};

if (_song == "NEXT") then {

	if (count CVO_Music_Queue > 0) then {

		_song = CVO_Music_Queue deleteAt 0;
		diag_log format ["[CVO][MUSIC](NEXT) %1", _song];
		diag_log format ["[CVO][MUSIC](updated Queue) %1", CVO_MUSIC_Queue];

	} else {

		_song = "";
		diag_log format ["[CVO][MUSIC](NEXT) Queue Empty %1", CVO_MUSIC_Queue];
	};
};

if (_song == "") exitWith {	diag_log "[CVO][MUSIC](Play) no song defined"	};

// Plays the song on all clients

if (CVO_Music_isPLaying) then {

	CVO_Music_Queue pushBack _song;
	diag_log format ["[CVO][MUSIC](Play) Added to Queue: %1", _song];

} else {

	_song remoteExec ["playMusic",0,"CVO_Music_JIP_playMusic"];
	CVO_Music_isPLaying = true;
	diag_log format ["[CVO][MUSIC](Play) Playing: %1 - Queue: %2", _song, CVO_MUSIC_Queue];

};

