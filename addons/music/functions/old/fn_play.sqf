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

if (!isServer) exitWith { [QGVAR(EH_play), _this] call CBA_fnc_serverEvent;	};


switch (_song) do {
	case "fadeStop": {
		if (GVAR(isPlaying)) then { [QGVAR(EH_fadeStop), 10] call CBA_fnc_globalEvent; };
		_song = "";
		"Zeus - Fade Stop" call FUNC(message);
	};
	case "fadeStopClear": {
		GVAR(Queue) = [];
		if (GVAR(isPlaying)) then { [QGVAR(EH_fadeStop), 10] call CBA_fnc_globalEvent; };
		_song = "";
		"Zeus - Queue cleared" call FUNC(message);
	};
	case "NEXT": {
		if (count GVAR(Queue) > 0) then {
			_song = GVAR(Queue) deleteAt 0;
			diag_log format ["[CVO][MUSIC](NEXT) %1", _song];
			diag_log format ["[CVO][MUSIC](updated Queue) %1", GVAR(Queue)];
			
			format ["Zeus - Queue: %1", count GVAR(Queue)] call FUNC(message);

		} else {
			diag_log format ["[CVO][MUSIC](NEXT) Queue Empty %1", GVAR(Queue)];
			_song = "";
			"Zeus - Queue empty" call FUNC(message);
		};
	};
};

if (_song isEqualTo "") exitWith { diag_log "[CVO][MUSIC](Play) no song defined" };

// Plays the song on all clients

if (GVAR(isPlaying)) then {

	GVAR(Queue) pushBack _song;
	format ["Song queued: %1", _song] call FUNC(message);
	

} else {

	[QGVAR(EH_playMusic), _song, QGVAR(JIP_playMusic)] call CBA_fnc_globalEventJIP;
	
	GVAR(isPlaying) = true;
	format ["Now Playing: %1", _song] call FUNC(message);

};