#include "..\script_component.hpp"

/*
* Author: Zorn
* Function that makes sure the Asset and its Crew is protected (Damage Disabled)
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
    ["_asset",          objNull,    [grpNull, objNull]  ],
    ["_protect",        true,       [true]              ]
];

if (_asset isEqualTo objNull) exitWith {false};

private ["_obj", "_grp"];
switch (typeName _asset) do {
    case "GROUP": {
        _obj = vehicle leader _asset;
        _grp = _asset;
    };
    case "OBJECT": {
        _obj = _asset;
        _grp = group driver _asset;
    };
};

{ _x allowDamage !_protect; } forEach (units _grp) + [_obj];