#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to add an Intel Object to an Intel Group for the Intel Summary.
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
    ["_intelGroup",  "",    [""]   ],
    ["_objVarName", "",    [""]   ]
];

ZRN_LOG_1(_this);

if (_intelGroup == "") exitWith {};

private _database = missionNamespace getVariable [ QGVAR(group_database), "404" ];

if (_database == "404") then {
    _database = createHashMap;
    missionNamespace setVariable [ QGVAR(group_database), _database ];
};

if ( _intelGroup in keys _database ) then {
    _database get _intelGroup pushBack _objVarName;
} else {
    _database set [ _intelGroup, [ _objVarName ] ];
};

private _obj = missionNamespace getVariable [_objVarName, ""];

if (_obj isEqualTo "") then { ZRN_LOG_MSG_1(object not found,_obj); };

_obj setVariable [QGVAR(group), _intelGroup];
[_obj] call FUNC(addDeletedEH);
