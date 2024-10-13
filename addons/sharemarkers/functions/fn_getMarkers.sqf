#include "../script_component.hpp"

/*
* Author: Zorn
* Get all Map makers based on Filter
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: Yes
*/

params [
    ["_filter", "ALLPLAYERS", [""]      ],
    ["_provider", ACE_PLayer, [objNull] ]
];

ZRN_LOG_MSG_2(INIT,_filter,_provider);

private _selection = switch (_filter) do {
    case "ALL": { allMapMarkers };
    case "ALLPLAYERS": { allMapMarkers select { "_USER_DEFINED" in _x } };
    case "ONLYTHIS": { allMapMarkers select { "_USER_DEFINED" in _x && {format ["#%1",getPlayerID _provider] in _x} } };
    default { [] };
};

if (count _selection == 0) exitWith { ZRN_LOG_MSG(No Markers found); systemChat "No suitable markers found!"; false };
ZRN_LOG_1(_selection);
private _markersHM = createHashMap;

_markersHM set ["filter", _filter];
_markersHM set ["provider", _provider];

{
    _markersHM set [_x, [_x] call FUNC(getMarkerData) ];
    
} forEach _selection;

ZRN_LOG_1(_markersHM);

_markersHM