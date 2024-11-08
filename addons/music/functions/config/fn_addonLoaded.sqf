#include "../../script_component.hpp"

/*
* Author: Zorn
* function to check if the input addon class (string) is loaded
*
* Arguments:
*
* Return Value:
* Boolean
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params [
    ["_addonClass",        "",         [""]       ]
];

private _result = true;

private _addons = missionNamespace getVariable [QGVAR(loadedAddons), "404"];
private _confirmed = missionNamespace getVariable [QGVAR(confirmedAddons), "404"];

if (_addons isEqualTo "404") then {_addons = "true" configClasses (configFile >> "CfgPatches") apply { configName _x }};
if (_confirmed isEqualTo "404") then { _confirmed = [] };

private _result = switch (true) do {
    case (_addonClass in _confirmed): { true };
    case (_addonClass in _addons): { _confirmed pushBackUnique _addonClass; true };
    default { ZRN_LOG_MSG_1(Addon Missing:,_addonClass); false };
};

SETMGVAR(confirmedAddons,_confirmed);
SETMGVAR(loadedAddons,_addons);

_result