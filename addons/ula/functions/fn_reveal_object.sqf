#include "..\script_component.hpp"

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

if (isNil "CVO_ULA_HM") exitWith {ZRN_LOG_MSG(Failed: CVO_ULA_HM not defined);};

private _layerMap = CVO_ULA_HM getOrDefault [_layerName, "404"];


if (_layerMap isEqualTo "404") exitWith {
    ZRN_LOG_MSG(Failed: _layerMap == 404);
};

private _meme = _objSource getVariable ["meme", false];

private _hiddenObjects = _layerMap get "hiddenObjects";
private _visibleObjects = _layerMap get "visibleObjects";

private _obj = _hiddenObjects deleteAt 0;
_obj hideObjectGlobal false;
_visibleObjects pushBack _obj;
private _count = count _hiddenObjects;

if (_meme) then { [QGVAR(EH_playSound), [_obj, "PLACE"]] call CBA_fnc_globalEvent; };


missionNamespace setVariable [_layerMap get "pubVarName", _count, true];

diag_log format ['[CVO](debug)(fn_reveal_object) Remaining _objects: %1 in  _layerName: %2', _count , _layerName];

if (_count > 0 ) exitWith {};

if (_meme) then { [QGVAR(EH_playSound), [_objSource, "BREAK"]] call CBA_fnc_globalEvent; }; 

deleteVehicle _objSource;

CVO_ULA_HM deleteAt _layerName;


if (count CVO_ULA_HM > 0) exitWith {};
CVO_ULA_HM = nil;

if (_meme) then { [QGVAR(EH_playSound), GVAR(EHID_meme)] call CBA_fnc_removeEventHandler; };
[QGVAR(EH_reveal_object), GVAR(EHID_reveal)] call CBA_fnc_removeEventHandler;
[QGVAR(EH_add_action), GVAR(EHID_add_action)] call CBA_fnc_removeEventHandler;

missionNamespace setVariable [QGVAR(EHID_meme), nil, true];
missionNamespace setVariable [QGVAR(EHID_reveal), nil, true];
missionNamespace setVariable [QGVAR(EHID_add_action), nil, true];

[QGVAR(EH_completed), [_layerName]] call CBA_fnc_serverEvent;