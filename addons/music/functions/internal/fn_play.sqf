#include "../../script_component.hpp"

/*
* Author: Zorn
* This function checks the queue and plays the track when able.
*
* Arguments:
* 
*
* Return Value:
* None
*
* Example:
* [] call prefix_component_fnc_functionname
*
* Public: No
*/


params [
    ["_track",        "",         [""]       ]
];

if (GETMGVAR(isPlaying,false)) then {
    ZRN_LOG_MSG_1(push to queue,_this);
    [_track] call FUNC(queue);
} else {
    ZRN_LOG_MSG_1(Play,_this);    
    [QGVAR(EH_play_remote), [_track]] call CBA_fnc_globalEvent;
};
