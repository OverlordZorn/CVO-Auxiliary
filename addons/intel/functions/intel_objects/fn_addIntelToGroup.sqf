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
    ["_groupName",  "",    [""]   ],
    ["_objVarName", "",    [""]   ]
];

if (_groupName == "") exitWith {};

private _database = missionNamespace getVariable [ QGVAR(group_database), "404" ];

if (_database == "404") then {
    _database = createHashMap;
    [] call FUNC(intel_database);
};

if ( _groupName in keys _database ) then {
    _database get _groupName pushBack _objVarName;
} else {
    _database set [ _groupName, [ _objVarName ] ];
};

private _obj = missionNamespace getVariable [_objVarName, ""];

if (_obj isEqualTo "") then { ZRN_LOG_MSG_1(object not found,_obj); };

_obj setVariable [QGVAR(group), _groupName];
[_obj] call FUNC(addDeletedEH);
