#include "../script_component.hpp"

/*
* Author: Zorn
* Function which makes the provided object fully static. no actions, no scrollwheel, no nothin'
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
    ["_obj",        objNull,         [objNull]       ]
];

if (isNull _obj) exitWith {};


_obj setDamage 1; 
_obj enableSimulationGlobal false; 
[_obj, _obj] call ace_common_fnc_claim; 
removeAllActions _obj;