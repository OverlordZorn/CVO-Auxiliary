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

private _hiddenObjects = _layerMap get "hiddenObjects";
private _visibleObjects = _layerMap get "visibleObjects";

private _obj = _hiddenObjects deleteAt 0;
_obj hideObjectGlobal false;
_visibleObjects pushBack _obj;
private _count = count _hiddenObjects;

missionNamespace setVariable [_layerMap get "pubVarName", _count, true];

diag_log format ['[CVO](debug)(fn_reveal_object) Remaining _objects: %1 in  _layerName: %2', _count , _layerName];

if (_count > 0 ) exitWith {};

deleteVehicle _objSource;
CVO_ULA_HM deleteAt _layerName;

if (count CVO_ULA_HM > 0) exitWith {};

CVO_ULA_HM = nil;

["cvo_ula_EH_completed", [_layerName]] call CBA_fnc_serverEvent;