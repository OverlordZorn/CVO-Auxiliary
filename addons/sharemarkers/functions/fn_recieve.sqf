#include "../script_component.hpp"

/*
* Author: Zorn
* Applies the provided markers (hashmap)
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [_allMarkersHashMap] call cvo_sharemarkers_fnc_recieve;
*
* Public: Yes
*/

params ["_allMarkersHashMap", "", [createHashMap]];

if (_allMarkersHashMap isEqualTo "") exitWith {};

private _requester = _allMarkersHashMap deleteAt "requester";
private _provider = _allMarkersHashMap deleteAt "provider";
private _type = _allMarkersHashMap deleteAt "type";



{
    [_y] call FUNC(applyMarkerData);
} forEach _allMarkersHashMap;