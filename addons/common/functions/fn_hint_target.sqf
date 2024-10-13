#include "../script_component.hpp"

/*
* Author: Zorn
* Function to send a Hint to the target player.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ["This is a Test Hint", _object] call cvo_common_fnc_hint_target
*
* Public: Yes
*/

if !(hasInterface) exitWith {};

// Registers CBA-EH on Mission Start.
if ( _this isEqualTo ["preInit"] ) exitWith { [QGVAR(EH_hint_target), FUNC(hint_target)] call CBA_fnc_addEventHandler; };


// Regular Function starts
params [
    ["_message",    "",         [""]              ],
    ["_targets",    objNull,    [objNull,[]]      ],
    ["_mode",       "DEFAULT",  [""]              ]     // Internal Use Only
];

switch (_mode) do {
    case "DEFAULT": {
        if ( _message == "" ) exitWith {};
        if ( isNull _targets ) exitWith {};
        if ( _targets isEqualType [] ) then { _targets = _targets select { _x isEqualType objNull } };
        [ QGVAR(EH_hint_target), [_message, objNull, "MSG"], _targets ] call CBA_fnc_targetEvent;
    };
    case "MSG": {
        params [ ["_msg", "", [""]] ];
        hint _msg;
    };
};