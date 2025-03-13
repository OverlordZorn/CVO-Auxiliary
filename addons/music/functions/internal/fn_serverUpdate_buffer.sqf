#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to buffer and create the msg to the server.
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

#define BUFFER_TIME 45

params ["_completedAt"];


private _isAlreadyBuffering = !isNil QGVAR(buffer);

missionNamespace setVariable [ QGVAR(buffer), CBA_MissionTime + BUFFER_TIME, false];
missionNamespace setVariable [ QGVAR(buffer_value), _completedAt, false];

if (!_isAlreadyBuffering) then {

    _condition = {
        missionNamespace getVariable [QGVAR(buffer), -1] < CBA_MissionTime 
    };  

    _statement = {
        params ["_completedAt"];

        [QGVAR(EH_update_server), [getPlayerID player, GVAR(buffer_value)]] call CBA_fnc_serverEvent;

        missionNamespace setVariable [ QGVAR(buffer), nil, false];
        missionNamespace setVariable [ QGVAR(buffer_value), nil, false];
    };

    [_condition, _statement, []] call CBA_fnc_waitUntilAndExecute;
};