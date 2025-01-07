#include "../../script_component.hpp"

/*
* Author: Zorn
* This function checks for a "Default Entry" Subclass of CfgCustomSupplyCrates in MissionConfigFile. If so, it will apply the provided settings as new default settings.
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

private _cfg = missionConfigFile >> "CfgCustomSupplyCrates"; 

if (!isClass _cfg) exitWith {};

_cfg = _cfg >> "DefaultEntry";

if (!isClass _cfg) exitWith {};

private _properties = configProperties [_cfg] apply { configName _x };

// retrieve current Default
private _defaultKeys = keys ([] call FUNC(defaultEntry));

private _newDefaults = createHashMap;

{
    // Filter certain properties
    if (_x in ["Name", "links"]) then { continue };

    if !(_x in _defaultKeys) then { continue };

    private _value = [_cfg >> _x] call BIS_fnc_getCfgData;
    
    _value = switch (_value) do {
        case "true": { true };
        case "false": { false };
        default { _value };
    };

    _newDefaults set [
        _x,
        _value
    ];
    
} forEach _properties;

// apply new Default values
[_newDefaults] call FUNC(defaultEntry);