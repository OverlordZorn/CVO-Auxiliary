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

params [
    ["_object",     objNull,    [objNull] ],
    ["_catName",    "Default",  [objNull] ]
];

if (_object isEqualTo objNull) exitWith {};

private _cat = missionNamespace getVariable [[ADDON,_catName] joinString "_", "404"];

if (_cat isEqualTo "404") then {
    _cat createHashMapFromArray [
        ["Departure", [_object]],
        ["Destinations", []]
    ];
    missionNamespace setVariable [[ADDON,_catName] joinString "_",_cat];
    [_object] call FUNC(addAction);
} else {
    _cat set [ "Departure", _cat get "Departure" pushBackUnique _object ];
};

_object setVariable [QGVAR(Departure), _catName];

