#include "../script_component.hpp"

/*
* Author: Zorn
* Store Markers on serverside map-marker-catalaog
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

if !(isServer) exitWith {};

params [
    ["_objReference",   objNull,            [objNull]       ],
    ["_provider",       objNull,            [objNull]       ],
    ["_requester",      objNull,            [objNull]       ],
    ["_catalogName",    QGVAR(cat_global),  [""]            ]
];

if (_objReference isEqualTo objNull) exitWith {};
if (_provider isEqualTo objNull) exitWith {};
if (_requester isEqualTo objNull) exitWith {};

private _catalog = missionNamespace getVariable [_catalogName, "404"];

if (_catalog isEqualTo "404") exitWith {};

private _markersHM = _catalog get [_objReference, _provider];

[QGVAR(EH_P2P_2_deliver), [_markersHM], _requester] call CBA_fnc_targetEvent;