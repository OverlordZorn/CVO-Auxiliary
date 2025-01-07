#include "../../script_component.hpp"

/*
* Author: Zorn
* This function will search for definitions 
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

private _exclude = ["DefaultEntry"];

private _configs = "true" configClasses _cfg select { !(configName _x in _exclude) };

{
    private _index = 1 + _forEachIndex; 
    private _map = createHashMap;
    configProperties [_x]
    select
    { ! ( configName _x in ["name", "items", "backpacks", "link_classes", "link_objects"] ) }
    apply
    { 
        private _value = [_x] call BIS_fnc_getCfgData;
        _value = switch (_value) do {
            case "true": { true };
            case "false": { false };
            default { _value };
        };
        _map set [configName _x, _value];
    };


    private _name = getText (_x >> "name");
    if (_name isEqualTo "") then { continue };
    private _objects = (_x >> "link_objects") call BIS_fnc_getCfgDataArray apply { missionNamespace getVariable [_x, objNull] } select { !isNull _x };
    private _classes = (_x >> "link_classes") call BIS_fnc_getCfgDataArray select { isClass (configFile >> "CfgVehicles" >> _x) };

    private _catName = getText (_x >> "catalog_name");
    if (_catName isEqualTo "") then { _catName = "global" };

    [
        _name,
        (_x >> "items") call BIS_fnc_getCfgDataArray,
        (_x >> "backpacks") call BIS_fnc_getCfgDataArray,
        _map
    ] call FUNC(register);

    {
        ZRN_LOG_MSG_1(to be linked:,_x);
        [ FUNC(link) , [_x, _name, _catName], _index + _forEachIndex ] call CBA_fnc_waitAndExecute;
    } forEach (_objects + _classes);

} forEach _configs;