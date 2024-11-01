#include "../../script_component.hpp"

/*
* Author: Zorn
* Function that will handle the player request and will send the needed information to the server.
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

// this stuff needs to happen on the client

if !(isServer) exitWith {};

params ["_target", "_player", "_actionParams"];
_actionParams params ["_entryName","_catName", "_mode"];

ZRN_LOG_MSG_1(INIT,_this);

private _cat = [_catName] call FUNC(catalog);
private _entry = _cat get _entryName;

private _deliveryMethod = switch (true) do {
    case (_mode == "ZEUS"): { _entry get "zeus_mode"};
    case (_mode == "NORMAL"): { _entry get "normal_mode"};
    default { false };
};

if (_deliveryMethod isEqualTo false) exitWith {};


switch (_deliveryMethod) do {
    case "AIRDROP": { [_entryName, _catName, _target, _player, _entry, _mode] call FUNC(request_airdrop)};
    default { };
};