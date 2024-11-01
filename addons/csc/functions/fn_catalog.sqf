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


private _catalogName = [_catName] call FUNC(getCatName);
ZRN_LOG_1(_catalogName);
private  _cat = missionNamespace getVariable [_catalogName, "404"];

if (_cat isEqualTo "404") then {
    _cat = createHashMap;
    _cat set ["Default Entry", [] call FUNC(defaultEntry)];
    
    missionNamespace setVariable [_catalogName, _cat];
    ZRN_LOG_MSG_1(catalog established,_catalogName in allVariables missionNamespace);
};

ZRN_LOG_MSG_1(Catalog Entries,keys _cat);
_cat