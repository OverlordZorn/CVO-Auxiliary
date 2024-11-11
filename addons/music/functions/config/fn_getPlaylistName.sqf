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

private _hasMissionConfig = isClass ( missionConfigFile >> "CfgPlaylists" >> _className);
private _hasConfig = isClass ( configFile >> "CfgPlaylists" >> _className);

private _cfgPath = switch (true) do {
    case (_hasMissionConfig): { missionConfigFile >> "CfgPlaylists" >> _className };
    case (_hasConfig): { configFile >> "CfgPlaylists" >> _className };
};

private _title = getText ( _cfgPath >> "name");

if (_title == "") then {_title = _className};

//ZRN_LOG_3(_hasMissionConfig,_hasConfig,_title);
_title