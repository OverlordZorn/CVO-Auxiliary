#include "../../script_component.hpp"

/*
* Author: Zorn
* This function handles all input requests
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

params [
    ["_input", "", [""] ],
    ["_args",  [], [[]] ]
];

ZRN_LOG_MSG_1(INIT,_input);

switch (_input) do {
    case "NEXT":      { [QGVAR(EH_request_server), _input] call CBA_fnc_serverEvent; };
    case "FADENEXT":  { [QGVAR(EH_request_server), _input] call CBA_fnc_serverEvent; };
    case "FADECLEAR": { [QGVAR(EH_request_server), _input] call CBA_fnc_serverEvent; };
    // Default case considers inputs as playlist
    default  { 
        if ( _input in GVAR(public_keys) ) then {
            [QGVAR(EH_request_server), _input] call CBA_fnc_serverEvent;
        };
    };
};
