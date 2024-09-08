#include "..\script_component.hpp"


/*
* Author: Zorn
* checks for or creates layerhashmap and establishes global Variable
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
diag_log "[CVO](debug)(fn_init_layer) init";

params [ "_obj", "_layerName", "_distance", "_time"];



private _gMap = missionNamespace getVariable ["CVO_ULA_HM", "404"];

if (_gMap isEqualTo "404") then { _gMap = createHashMap; };

if (_layerName in _gMap) exitWith { diag_log format ['[CVO](debug)(fn_init_layer) EXIT - _layerName: %1 already in _gMap: %2',_layerName, _gMap]; };

private _varName = ["CVO", "ula","remaining", _layerName] joinString "_";

private _objects = getMissionLayerEntities _layerName select 0;

// Sorts objects based of their ASL, from lowest to highest
_objects = [_objects, [], {(getPosASL _x)#2}, "ASCEND"] call BIS_fnc_sortBy;
 

[{{ _x hideObjectGlobal true } forEach _this}, _objects, 1] call CBA_fnc_waitAndExecute;

missionNamespace setVariable [_varName, count _objects, true];

// create Hashmap with all the information about
private _layerMap = createHashMapFromArray [
    ["layername", _layerName],
    ["visibleObjects", []],
    ["hiddenObjects", _objects],
    ["pubVarName", _varName],
    ["medianPosASL", [_objects] call cvo_common_fnc_getMedianPosASL]
];


_gMap set [_layerName, _layerMap];

missionNamespace setVariable ["CVO_ULA_HM", _gMap, true];

diag_log "[CVO](debug)(fn_init_layer) Done";
true

