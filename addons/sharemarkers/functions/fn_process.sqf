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


params [
    "_requester",
    "_provider",
    ["_filter",     "ALLPLAYERS",   [""]    ]  
];

private _markersHM = [_filter, _player] call FUNC(getMarkers);
if (_markersHM isEqualTo false) exitWith { ZRN_LOG_MSG_1(No markers found,_filter);};


[QGVAR(EH_P2P_2_deliver), [_markersHM], _requester] call CBA_fnc_targetEvent;