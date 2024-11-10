#include "../../script_component.hpp"

/*
* Author: Zorn
* This Function takes a Config Class and establishes the playlist hashmap.
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
    [   "_cfg",  configNull, [configNull]    ]
];

private _dependencies = getArray (_cfg >> "dependencies");

private _dependencyLoaded = true;
{ if !( [_x] call FUNC(AddonLoaded) ) then { _dependencyLoaded = false } } forEach _dependencies;

private _name = configName _cfg;
if (!_dependencyLoaded) exitWith {ZRN_LOG_MSG_1(Dependency Missing,_name);};

private _tracks = getArray (_cfg >> "tracks");

["ADD", [_name, _tracks]] call FUNC(catalog);