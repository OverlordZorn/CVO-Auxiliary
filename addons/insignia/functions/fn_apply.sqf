params [
    ["_unit", player, [objNull]],
    ["_className", "", [""]]
];

if (_unit isEqualTo objNull) exitWith {};
if (_className isEqualTo "") exitWith {};


// Check if _className exists in CfgUnitInsignia
if !(_className in ("true" configClasses (configFile >> "CfgUnitInsignia") apply { configName _x})) exitWith {false};

_unit setVariable ["BIS_fnc_setUnitInsignia_class", nil];
[_unit, _className] call BIS_fnc_setUnitInsignia;

  