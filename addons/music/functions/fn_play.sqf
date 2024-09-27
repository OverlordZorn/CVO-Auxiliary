#include "../script_component.hpp"

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

if (!isServer) exitWith {	[QGVAR(EH_play), _this] call CBA_fnc_serverEvent;	};


switch (_song) do {
	case "fadeStop": {
		if (GVAR(isPlaying)) then { [QGVAR(EH_fadeStop), 10] call CBA_fnc_globalEvent; };
		_song = "";
	};
	case "fadeStopClear": {
		GVAR(Queue) = [];
		if (GVAR(isPlaying)) then { [QGVAR(EH_fadeStop), 10] call CBA_fnc_globalEvent; };
		_song = "";
	};
	case "NEXT": {
		if (count GVAR(Queue) > 0) then {
			_song = GVAR(Queue) deleteAt 0;
			diag_log format ["[CVO][MUSIC](NEXT) %1", _song];
			diag_log format ["[CVO][MUSIC](updated Queue) %1", GVAR(Queue)];
		} else {
			diag_log format ["[CVO][MUSIC](NEXT) Queue Empty %1", GVAR(Queue)];
			_song = "";
		};
	};
};

if (_song isEqualTo "") exitWith { diag_log "[CVO][MUSIC](Play) no song defined" };

// Plays the song on all clients

if (GVAR(isPlaying)) then {

	GVAR(Queue) pushBack _song;
	diag_log format ["[CVO][MUSIC](Play) Added to Queue: %1", _song];

} else {

	
	[QGVAR(EH_playMusic), _song, QGVAR(JIP_playMusic)] call CBA_fnc_globalEventJIP;
	
	GVAR(isPlaying) = true;
	diag_log format ["[CVO][MUSIC](Play) Playing: %1 - Queue: %2", _song, GVAR(Queue)];

};

