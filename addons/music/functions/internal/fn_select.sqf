#include "../../script_component.hpp"

/*
* Author: Zorn
* This function will return a track based on the provided playlist and selection method.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params [
    ["_playlist",   "",         [""]],
    ["_selectMode", "RANDOM",   [""]]
];

private  _cat = missionNamespace getVariable [QGVAR(HM_playlists), "404"];

if (_cat isEqualType "") then {
    _cat = createHashMap;
    missionNamespace setVariable [QGVAR(HM_playlists), _cat];
};


if !(_playlist in _cat) exitWith {ZRN_LOG_MSG(Failed - Playlist does not exist);};
private _base = _cat get _playlist;
if (count _base == 0)   exitWith {ZRN_LOG_MSG(Failed - Playlist is Empty);};

private _pool = _cat get ([_playlist,"pool"] joinString "_");
if (count _pool == 0) then { ["RESET", _playlist] call FUNC(catalog) };


private _selected = switch (_selectMode) do {
    case "RANDOM": { selectRandom _pool };
    case "FIRST":  { _pool select 0 };
};

_pool deleteAt (_pool find _selected);

_selected