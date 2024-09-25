#include "../script_component.hpp"

/*
* Author: Zorn
* [Description]
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

if !(isServer) exitWith {};

params [
    ["_revealLayer",    "404", [""]     ],
    ["_deleteLayer",    "404", [""]     ]
];

if (_revealLayer isEqualTo "404") exitWith {};
if (_deleteLayer isEqualTo "404") exitWith {};

private _hashMap = missionNamespace getVariable [QGVAR(HM_Delete), "404"];
if (_hashMap isEqualTo "404") then {_hashMap = createHashMap};

_hashMap set [_revealLayer, _deleteLayer];

missionNamespace setVariable [QGVAR(HM_Delete), _hashMap];


// Server Event
if (isNil QGVAR(EHID_deleteLayer)    ) then { GVAR(EHID_deleteLayer) = [QGVAR(EH_completed), FUNC(delete_layer)] call CBA_fnc_addEventHandler; };
