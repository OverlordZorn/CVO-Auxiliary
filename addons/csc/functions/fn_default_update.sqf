#include "../script_component.hpp"

/*
* Author: Zorn
* function to edit a catalogs default.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: Yes
*/

params [
    ["_newDefaults",        "404",      [createHashMap] ],
    ["_catalogName",        "global",   [""]            ]
];

if (_newDefaults isEqualTo "404") exitWith {};

private _catalog = [_catalogName] call FUNC(catalog);
private _previousDefaults = _catalog get "Default Entry";
_previousDefaults merge [_newDefaults, true];