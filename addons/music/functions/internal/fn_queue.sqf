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

private _queue = GETMGVAR(queue,"404");

if (_queue isEqualTo "404") then {
    _queue = [];
    SETMGVAR(queue,_queue);
};

private _return = "";
if ( _input == "" ) exitWith { ZRN_LOG_MSG(outputting queue); _queue };

switch (_input) do {
    case "CLEAR": {
        SETMGVAR(queue,nil); _return = "CLEARED";
    };
    case "NEXT":  {
        _return = _queue deleteAt 0;
        ZRN_LOG_MSG_1(NEXT,_return);
        if (count _queue == 0) then { ["CLEAR"] call FUNC(queue) };
    };
    default {
        ZRN_LOG_MSG_1(stored,_input);
        _queue pushBack _input;
        _return = "STORED";
    };
};

_return