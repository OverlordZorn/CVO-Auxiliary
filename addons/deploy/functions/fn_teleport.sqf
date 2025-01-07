#include "../script_component.hpp"

/*
* Author: Zorn
* [Description]
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
    ["_unit",        objNull, [objNull]       ],
    ["_destination", false,   [createHashMap] ]
];

if ( _unit isEqualTo objNull || { _destination isEqualTo false } ) exitWith {};

private _target = _destination get "target";
private _min =    _desitnation get "min";
private _max =    _desitnation get "max";

switch (true) do {
    case (typeName _target == "ARRAY"): { _unit setPosASL _target };
    case (_target emptyPositions  "" > 0) : { _unit moveInAny _target };
    default { _unit setPos (getPos _target findEmptyPosition [_min,_max]) };
};