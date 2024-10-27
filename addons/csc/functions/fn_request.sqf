#include "../script_component.hpp"

/*
* Author: Zorn
* Function that will handle the request of the supply crate - ether it gets created "normally" or it will initialise an airdrop.
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

// this stuff needs to happen on the server

if !(isServer) exitWith {};

params ["_target", "_player", "_actionParams"];
_actionParams params ["_entryName","_catName"];

ZRN_LOG_MSG_1(INIT,_this);


if (typeOf _target isEqualTo "ModuleCurator_F") then { /* ZEUS AIRDROP REQUEST*/ };