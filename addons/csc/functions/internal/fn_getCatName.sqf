#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to create catalog variable name string
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [_catName] call prefix_component_fnc_functionname
* [_catName] call FUNC(getCatName)
* [_catName,"zeus"] call FUNC(getCatName)
*
* Public: No
*/

params [
    ["_catName",        "global",   [""]       ],
    ["_suffix",         "",         [""]       ]
];

if (_suffix == "") then {
    [QPREFIX,QCOMPONENT,"cat",_catName] joinString "_"
} else {
    [QPREFIX,QCOMPONENT,_catName,_suffix] joinString "_"
};