#include "../script_component.hpp"

/*
* Author: Zorn
* Function to handle the CSC Catalog
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
    ["_catName",       "global",            [""]    ]
];


private _catalogName = [PERFIX,COMPONENT,"CAT",_catName] joinString "_";
private  _cat = missionNamespace getVariable [_catalogName, "404"];

if (_cat isEqualTo "404") then {
    _cat = createHashMap;
    _cat set ["Default Entry", [] call FUNC(defaultEntry)];
};

_cat