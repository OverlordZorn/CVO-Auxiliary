#include "../../script_component.hpp"

/*
* Author: Zorn
* This function will handle the cvo arsenal when its defined through missionConfigFile.
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
private _cfg = missionConfigFile >> "CfgArsenal";
if !(isClass _cfg) exitWith {};

if (isServer) then {
    private _layerName = getText (_cfg >> "editor_layer_name");
	private _array = [];
    [_cfg >> "object_variable_names"] call BIS_fnc_getCfgDataArray apply { missionNamespace getVariable [_x, objNull] } select { !isNull _x } apply { _array pushBackUnique _x };

    private _return = getMissionLayerEntities _layerName;
    if (count _return > 0) then { _array append _return#0 }; 

    [QGVAR(EH_AddAction), _array, QGVAR(EH_AddAction)] call CBA_fnc_globalEventJIP;
};

// Handle Base Items
private _base = missionNamespace getVariable [QGVAR(base), []];
if (count _base == 0) then { missionNamespace setVariable [QGVAR(base), _base] };
configProperties [_cfg >> "Base"] apply { [_x] call BIS_fnc_getCfgDataArray } apply { _base append _x };

// Handle Role Based Equipment
private _role_map = missionNamespace getVariable [QGVAR(roleKit), "404"];
if (_role_map isEqualTo "404") then {
    _role_map = createHashMap;
    missionNamespace setVariable [QGVAR(roleKit), _role_map];
};

"true" configClasses (_cfg >> "Roles") apply {
    _role_map set [
        configName _x,
        [
            (_x >> "items") call BIS_fnc_getCfgDataArray,
            compile getText (_x >> "code")
        ]
    ]
};

// Handle Player Based Equipment
private _player_map = missionNamespace getVariable [QGVAR(playerKit), "404"];
if (_player_map isEqualTo "404") then {
    _player_map = createHashMap;
    missionNamespace setVariable [QGVAR(playerKit), _player_map];
};

"true" configClasses (_cfg >> "Players") apply {
    _player_map set [
        getText (_x >> "id"),
        [
            configName _x,
            (_x >> "items") call BIS_fnc_getCfgDataArray,
            compile getText (_x >> "code")
        ]
    ]
};