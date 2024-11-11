#include "../../script_component.hpp"

/*
* Author: Zorn
* function to retrieve the Name of a playlist, ether configFile or missionConfigFile. If 
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
    ["_className",        "",         [""]       ]
];

private _hasMissionConfig = isClass ( missionConfigFile >> "CfgMusic" >> _className);
private _hasConfig = isClass ( configFile >> "CfgMusic" >> _className);

private _cfgPath = switch (true) do {
    case (_hasMissionConfig): { missionConfigFile >> "CfgMusic" >> _className };
    case (_hasConfig): { configFile >> "CfgMusic" >> _className };
};

private _title = getText ( _cfgPath >> "name");

if (_title == "") then {_title = _className};

_title