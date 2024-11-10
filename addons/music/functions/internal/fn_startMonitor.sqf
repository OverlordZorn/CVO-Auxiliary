#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to Start the PFH to Monitor the clients who are actively playing a song.
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


private _condition = { count GETMGVAR(monitor_map,0) > 0};

private _codeToRun = { { if ( _y < CBA_MissionTime ) then { _map deleteAt _x } } forEach GETMGVAR(monitor_map,"404") };

private _exitCode = {
    SETMGVAR(monitor_map,nil);
    SETMGVAR(monitor_id,nil);
    SETMGVAR(isPlaying,false);


    private _delay = GETMGVAR(SET_delay_min,60) + GETMGVAR(SET_delay_random,60);

    private _log = format ["Next Song will be requested in %1s at %2",_delay, _delay + CBA_missionTime];
    ZRN_LOG_MSG(_log);

    [ { ["NEXT"] call FUNC(request_Server) } , [], _delay] call CBA_fnc_waitAndExecute;
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
