#include "../script_component.hpp"

/*
* Author: Zorn
* function to define pos_target based on targetMode
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


params [
    ["_entryName",  "",     [""]],
    ["_mode",       "",     [""]]
];

private _catalog = missionNamespace getVariable [QGVAR(catalog), "404"];
if (_catalog isEqualTo "404") exitWith {};
if !(_entryName in _catalog) exitWith {};

private _entry = _catalog get _entryName;


if (_mode == "MAPCLICK") exitWith { [_entryName] call FUNC(getPosFromMap); };


private _tgtPos = switch (_mode) do {
    case "PREDEFINED": { _entry get "pos_target" };
    case "PLAYER": { getPos player };
    default { [0,0,0] };
};

[QGVAR(EH_dispatch), [_entryName,_tgtPos] ] call CBA_fnc_serverEvent;