#include "../../script_component.hpp"

/*
* Author: Zorn
* This function will be executed on the server when the players send an update about their "ismusicplaying" state incl. remaining duration etc.

*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_playerID", "_completedAt"];

ZRN_LOG_MSG_1(INIT,_this);

private _hashMap = GETMGVAR(monitor_map,"404");
private _pfh_id =  GETMGVAR(monitor_id,"404");

if (_hashMap isEqualTo "404") then {
    _hashMap = createHashMap;
    SETMGVAR(monitor_map,_hashMap);
};

// private _checkPFH = false;

if (_completedAt != -1) then {
    // add/overwrite existing entry.
    _hashMap set [_playerID, _completedAt];
    SETMGVAR(isPlaying,true);
    // _checkPFH = true;
} else {
    _hashMap deleteAt _playerID;
};

if (_pfh_id isEqualTo "404") then {

    ZRN_LOG_MSG_1(Init PFH,_pfh_id);
    [] call FUNC(startMonitor);

};