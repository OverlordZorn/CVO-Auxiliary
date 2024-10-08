#include "../script_component.hpp"

/*
* Author: Zorn
* Registers the supplydrop and its meta data and creates a ZEUS Interaction for it.
* To be Executed on Server + all clients.
*
* Arguments:
*
* 0 - <STRING>           "Monkey Supply Crate"              Name of the Supplydrop
* 1 - <Nested Array>    [["ace_banana", 69]]                Nested Array of Items to be filled into the crate
* 2 - <Nested Array>    [["ace_banana", 69]]                Nested Array of Backpacks to be filled into the crate
* 3 - <hashMap>         hashmap of additional parameters    Reference fn_defaultEntry.sqf for possible entries.
*
* Example:
*
* Public: Yes
*/

params [
    ["_name",           "Default",          [""]                ],
    ["_items",          [],                 [[]]                ],
    ["_backpacks",      [],                 [[]]                ],
    ["_params",         "404",               [createHashMap]    ]
];


private _catalog = missionNamespace getVariable [QGVAR(catalog), "404"];

if (_catalog isEqualTo "404") then {
    
    ZRN_LOG_MSG(Catalog Created);
    _catalog = createHashMap;
    missionNamespace setVariable [QGVAR(catalog), _catalog];

    [] call FUNC(createZeusInteraction);
};

if (_name in _catalog) exitWith { ZRN_LOG_MSG(SupplyDrop with this Name already exists); };

private _entry = [] call FUNC(defaultEntry);

_entry set ["Name", _name];
_entry set ["items", _items];
_entry set ["backpacks", _backpacks];


if (_params isNotEqualTo "404") then { _entry merge [_params, true] };

if !(isClass (configFile >> "Cfgvehicles" >> _entry get "class_box"))  exitWith {ZRN_LOG_MSG(Failed: undefined class_box);};
if !(isClass (configFile >> "Cfgvehicles" >> _entry get "class_air"))  exitWith {ZRN_LOG_MSG(Failed: undefined class_air);};
if !(isClass (configFile >> "Cfgvehicles" >> _entry get "class_para")) exitWith {ZRN_LOG_MSG(Failed: undefined class_para);};


_catalog set [_name, _entry];

ZRN_LOG_1(keys _catalog);

true

