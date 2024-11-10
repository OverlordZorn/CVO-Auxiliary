#include "../../script_component.hpp"

/*
* Author: Zorn
* This function handles the Request on the server Side that come from the Players
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

#define DEFAULTFADETIME 10

if !(isServer) exitWith {};


params [
    ["_input", "", [""] ],
    "_args"
];


switch (_input) do {
    case "FADENEXT": {
        [QGVAR(EH_fade_remote), DEFAULTFADETIME] call CBA_fnc_globalEvent;
        [ { ["NEXT"] call FUNC(request) } , [], DEFAULTFADETIME * 1.1] call CBA_fnc_waitAndExecute;
    };

    case "NEXT": {
        if (GETMGVAR(isPlaying,false)) then {
            ZRN_LOG_MSG(NEXT - while playing true -> FADENEXT);
            ["FADENEXT"] call FUNC(request);
        } else {
            private _nextTrack = ["NEXT"] call FUNC(queue);
            if (_nextTrack isEqualTo "") exitWith {};        // No track 
            [_nextTrack] call FUNC(play);
        };
    };

    case "FADECLEAR": {
        [QGVAR(EH_fade_remote), DEFAULTFADETIME] call CBA_fnc_globalEvent;
        ["CLEAR"] call FUNC(queue);
    };

    default { 
        // Assume provided string is the name of a playlist and select based on cba setting
        private _selectMode = "RANDOM";
        private _track = [_input, _selectMode] call FUNC(select);
        [_track] call FUNC(play);
    };
};
