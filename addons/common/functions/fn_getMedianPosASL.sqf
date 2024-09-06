/*
* Author: Zorn - Jenna
* returns middle position of all objects within a layer
*
* Arguments:
0   _objectArray <array> Array of Objects to calculate median position. (ASL)
*
* Return Value:
* _medianPosition - Position in ASL Format
*
* Example:
* ['something', player] call cvo_common_fnc_getMedianPosASL
*
* Public: Yes
*/

params [
    ["_objArray", [], [[]]]
];

if (!isServer) exitWith {false};
if (count _objArray == 0) exitWith {false};


// get Median Position as "target pos" - thanks jenna!

private _medianPosition = [];
{ _medianPosition = _medianPosition vectorAdd (getPosASL _x); } forEach _objects;
_medianPosition = _medianPosition vectorMultiply (1/count _objects);

_medianPosition