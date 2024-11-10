#include "../../script_component.hpp"

/*
* Author: Zorn
* This Function manages
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

// Continue here - queue doesnt seem to work

params [
    ["_input",        "",         [""]       ]
];

ZRN_LOG_MSG_1(INIT,_input);

private _return = "";

// Handles Return
// ""       -> Returns the current Queue or [] if queue is NIL
// "CLEAR"  -> NIL's the GVAR
// "NEXT"   -> Will Return the 
// Default  -> Store input in queue

switch (_input) do {
    case "": {
        private _queue = GETMGVAR(queue,"404");
        if {_queue == "404"} then {_queue = []};
        _return = _queue;
    };
    case "CLEAR": {
        SETMGVAR(queue,nil);
        _return = "CLEARED";
    };
    case "NEXT":  {
        private _queue = GETMGVAR(queue,"404");
        if (_queue isEqualTo "404") then {
            _return = "";
        } else {
            _return = _queue deleteAt 0;
            if (count _queue == 0) then { ["CLEAR"] call FUNC(queue) };
        };

    };
    default {
        private _queue = GETMGVAR(queue,"404");
        if (_queue isEqualTo "404") then {
            _queue = [];
            SETMGVAR(queue,_queue);
        };
        _queue pushBack _input;
        _return = "STORED";
    };
};
ZRN_LOG_1(_return);
_return