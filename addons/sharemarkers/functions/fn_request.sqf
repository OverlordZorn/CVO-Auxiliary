#include "../script_component.hpp"

/*
* Author: Zorn
* This function handles the initial request of
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

// Type:
// "ALL"            requests all map markers, including editor/script placed markers
// "ALLPLAYERS"     requests all userdefined map markers. excluding editor/script placed markers
// "ONLYTHIS"       requests only userdefined mapmarkers, which have been made by the provider themselves.

params ["_target", "_player", "_actionParams"];
_actionParams params [
    ["_filter",       "ONLYTHIS",     [""]        ]
];

if !(isPlayer _target) exitWith {};
if !(_filter in ["ALL", "ALLPLAYERS", "ONLYTHIS"]) exitWith {};

private _requester = _player;
private _provider = _target;

[QGVAR(EH_P2P_1_request), [_requester, _provider, _filter], _provider] call CBA_fnc_targetEvent;
