#include "../script_component.hpp"

/*
* Author: Zorn
* identifies and applies the unit's insignia
*
* Arguments:
* 0 _unit <Object>
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_insignia_fnc_autoAssign
*
* Public: Yes
*/

params [
    ["_unit", player, [objNull]]
];

private _className = [_unit] call FUNC(identify);
if (_classname isEqualTo false) exitWith {};
[_unit, _className] call FUNC(apply);

