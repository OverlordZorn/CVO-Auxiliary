/*
* Author: Zorn
* [Description]
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

if (!isServer) exitWith {};

params [
    ["_layerName",      "",         [""]        ],
    ["_objSource",      objNull,    [objNull]   ]
];

diag_log "[CVO](debug)(fn_reveal_object) INIT";
diag_log format ['[CVO](debug)(fn_reveal_object) _this: %1', _this];

if (isNil "CVO_ULA_HM") exitWith {};

private _layerMap = CVO_ULA_HM getOrDefault [_layerName, "404"];

diag_log format ['[CVO](debug)(fn_reveal_object) _layerName: %1', _layerName];

if (_layerMap isEqualTo "404") exitWith {};

private _meme = _objSource getVariable ["meme", false];

private _hiddenObjects = _layerMap get "hiddenObjects";
private _visibleObjects = _layerMap get "visibleObjects";

private _obj = _hiddenObjects deleteAt 0;
_obj hideObjectGlobal false;
_visibleObjects pushBack _obj;
private _count = count _hiddenObjects;

if (_meme) then { ["cvo_ula_EH_playSound", [_obj, "PLACE"]] call CBA_fnc_globalEvent; };


missionNamespace setVariable [_layerMap get "pubVarName", _count, true];

diag_log format ['[CVO](debug)(fn_reveal_object) Remaining _objects: %1 in  _layerName: %2', _count , _layerName];

if (_count > 0 ) exitWith {};

if (_meme) then { ["cvo_ula_EH_playSound", [player, "BREAK"]] call CBA_fnc_globalEvent; };
deleteVehicle _objSource;
CVO_ULA_HM deleteAt _layerName;




if (count CVO_ULA_HM > 0) exitWith {};
CVO_ULA_HM = nil;

if (_meme) then { ["cvo_ula_EH_playSound", CVO_ULA_EHID_meme] call CBA_fnc_removeEventHandler; };
["cvo_ula_EH_reveal_object", CVO_ULA_EHID_reveal] call CBA_fnc_removeEventHandler;
["cvo_ula_EH_add_action", CVO_ULA_EHID_add_action] call CBA_fnc_removeEventHandler;

missionNamespace setVariable ["CVO_ULA_EHID_meme", nil, true];
missionNamespace setVariable ["CVO_ULA_EHID_reveal", nil, true];
missionNamespace setVariable ["CVO_ULA_EHID_add_action", nil, true];

["cvo_ula_EH_completed", [_layerName]] call CBA_fnc_serverEvent;