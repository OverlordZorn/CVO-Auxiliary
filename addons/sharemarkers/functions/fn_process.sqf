#include "../script_component.hpp"

/*
* Author: Zorn
* Filters all Map Markers based the request.
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


params ["_requester", "_provider", "_type"];

private _selection = switch (_type) do {
    case "ALL": { allMapMarkers };
    case "ALLPLAYERS": { allMapMarkers select { "_USER_DEFINED" in _x } };
    case "ONLYTHIS": { allMapMarkers select { "_USER_DEFINED" in _x && {format ["#%1",getPlayerID _provider] in _x} } };
    default { [] };
};

if (count _selection == 0) exitWith {};

private _mapMarkersHM = createHashMap;

_mapMarkersHM set ["requester", _requester];
_mapMarkersHM set ["provider", _provider];
_mapMarkersHM set ["type", _type];

{
    _mapMarkersHM set [_x, [_x] call FUNC(getMarkerData) ];
    
} forEach _selection;

_mapMarkersHM