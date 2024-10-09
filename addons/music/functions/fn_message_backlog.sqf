#include "../script_component.hpp"

/*
* Author: Zorn
* Handles the message Backlog for Hint Messages
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
    ["_message", "", [""]]
];

private _backlog = missionNamespace getVariable [QGVAR(msg_backlog), []];

_backlog pushBack _message;

missionNamespace setVariable [QGVAR(msg_backlog), _backlog];

[ { missionNamespace getVariable [QGVAR(msg_backlog), []] deleteAt 0 } , [], 10] call CBA_fnc_waitAndExecute;

_backlog