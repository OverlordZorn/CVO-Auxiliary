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

    private _condition = { count GETMGVAR(monitor_map,0) > 0};
    
    private _codeToRun = { { if ( _y < CBA_MissionTime ) then { _map deleteAt _x } } forEach GETMGVAR(monitor_map,"404") };
    
    private _exitCode = {
        SETMGVAR(monitor_map,nil);
        SETMGVAR(monitor_id,nil);
        SETMGVAR(isPlaying,false);
        [ { ["NEXT"] call FUNC(request_Server); } , [], GETMGVAR(SET_delay_min,60) + GETMGVAR(SET_delay_random,60)] call CBA_fnc_waitAndExecute;
    };
    private _delay = 10;
    
    _pfh_id = [{
        params ["_args", "_handle"];
        _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];
    
        if (_parameters call _condition) then {
            _parameters call _codeToRun;
        } else {
            _handle call CBA_fnc_removePerFrameHandler;
            _parameters call _exitCode;
        };
    }, _delay, [_codeToRun, [], _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;

    missionNamespace setVariable [QGVAR(monitor_id), _pfh_id];
};