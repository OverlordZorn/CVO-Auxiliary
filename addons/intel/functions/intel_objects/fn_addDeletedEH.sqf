#include "../../script_component.hpp"

/*
* Author: Zorn
* function to add an event handler to the object
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

params ["_obj"];

private _return = _obj addEventHandler ["Deleted", {
	params ["_entity"];

    private _groupName = _entity getVariable [QGVAR(group), "404"];

    private _array = missionNamespace getVariable [QGVAR(discovered), []];
    _array pushBackUnique _groupName;

    missionNamespace setVariable [QGVAR(discovered), _array, true];


    [ { [QGVAR(EH_update), [], QGVAR(EH_update)] call CBA_fnc_globalEventJIP; } , [], 1] call CBA_fnc_waitAndExecute;
}];

diag_log format ['[CVO](debug)(fn_addDeletedEH) _return: %1', _return];

// I need to register the event which will cause the update on each client and i need to raise this event