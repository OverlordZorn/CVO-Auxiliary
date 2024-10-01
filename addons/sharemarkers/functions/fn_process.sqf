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

private _mapMarkers = createHashMap;

_mapMarkers set ["requester", _requester];
_mapMarkers set ["provider", _provider];
_mapMarkers set ["type", _type];

{
    _mapMarkers set [_x, [_x] call FUNC(getMarkerData) ];
    
} forEach _selection;

_mapMarkers