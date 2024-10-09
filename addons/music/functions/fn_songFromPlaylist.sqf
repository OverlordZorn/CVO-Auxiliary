#include "../script_component.hpp"

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

private _map = missionNamespace getVariable [QGVAR(Playlist_HM), "404"];
if (_map isEqualTo "404") exitWith {};

private _selection = _map getOrDefault [_playlist, "404"];

if (_selection isEqualTo "404") exitWith {};
if ( count _selection == 0 ) exitWith {};

private _song = selectRandom _selection;


[QGVAR(EH_play), _song] call CBA_fnc_serverEvent;