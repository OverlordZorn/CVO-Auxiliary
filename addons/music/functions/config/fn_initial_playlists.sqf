#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to scan configFile and missionConfigFile for CfgPlaylists classes and initialises them.
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

if !(isServer) exitWith {};

private _configs = [];

private _cfgPath = (configFile >> "CfgPlaylists");
if (isClass _cfgPath) then {
    private _cfgs = "true" configClasses _cfgPath;
    _configs append _cfgs;
};

private _cfgPath = (missionConfigFile >> "CfgPlaylists");
if (isClass _cfgPath) then {
    private _cfgs = "true" configClasses _cfgPath;
    _configs append _cfgs;
};
{ [_x] call FUNC(fromConfig) } forEach _configs;