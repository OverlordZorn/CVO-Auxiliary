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
* [_markersRecieved] call cvo_sharemarkers_fnc_recieve;
*
* Public: Yes
*/

params [
    ["_markersRecieved", "", [createHashMap]]
];

if (_markersRecieved isEqualTo "") exitWith {ZRN_LOG_MSG(failed: input failed);};

private _requester = _markersRecieved deleteAt "requester";
private _provider = _markersRecieved deleteAt "provider";
private _type = _markersRecieved deleteAt "type";


{
    ZRN_LOG_MSG_1(ForEach,_x);
    [_y] call FUNC(applyMarkerData);
} forEach _markersRecieved;